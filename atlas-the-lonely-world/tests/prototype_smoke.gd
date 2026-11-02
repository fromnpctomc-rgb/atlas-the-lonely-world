extends SceneTree
var failures: int = 0

func _initialize() -> void:
	call_deferred("run_checks")

func frames(count: int) -> void:
	for i in range(count):
		await physics_frame
		await process_frame

func check(condition: bool, label: String) -> void:
	print(("PASS: " if condition else "FAIL: ") + label)
	if not condition:
		failures += 1

func measure_jump(player: CharacterBody2D, hold_frames: int) -> Vector2:
	player.position = Vector2(200, 620)
	player.velocity = Vector2.ZERO
	await frames(5)
	var peak := 620.0
	var duration := 0.0
	Input.action_press("okto_jump")
	for i in range(120):
		if i == hold_frames:
			Input.action_release("okto_jump")
		await frames(1)
		peak = minf(peak, player.position.y)
		duration += 1.0 / 60.0
		if i > 3 and player.is_on_floor():
			break
	Input.action_release("okto_jump")
	return Vector2(620.0 - peak, duration)

func run_checks() -> void:
	var room := load("res://Scene/prototype/greybox.tscn").instantiate() as Node2D
	root.add_child(room)
	await frames(60)
	var player := room.get_node("Okto") as CharacterBody2D
	check(player.is_on_floor() and absf(player.position.y - 620.0) < 2.0, "spawn settles on floor collision")
	var start_x := player.position.x
	Input.action_press("okto_right")
	await frames(20)
	check(player.position.x > start_x + 25.0, "right movement")
	Input.action_release("okto_right")
	await frames(20)
	check(absf(player.velocity.x) < 1.0, "release stops movement")
	Input.action_press("okto_left")
	await frames(15)
	check(player.velocity.x < -140.0, "left movement")
	Input.action_release("okto_left")
	player.position = Vector2(200, 620)
	player.velocity = Vector2.ZERO
	await frames(5)
	Input.action_press("okto_jump")
	await frames(10)
	check(player.position.y < 590.0 and player.velocity.y < 0.0, "grounded jump rises")
	Input.action_release("okto_jump")
	await frames(60)
	check(player.is_on_floor() and absf(player.position.y - 620.0) < 2.0, "jump lands without floor penetration")
	player.position = Vector2(440, 450)
	player.velocity = Vector2.ZERO
	await frames(40)
	check(player.is_on_floor() and absf(player.position.y - 528.0) < 2.0, "elevated platform supports landing")
	player.position = Vector2(1810, 620)
	player.velocity = Vector2.ZERO
	Input.action_press("okto_right")
	await frames(60)
	check(player.position.x <= 1838.5 and player.is_on_wall(), "solid wall blocks horizontal motion")
	Input.action_release("okto_right")
	player.position = Vector2(2600, 620)
	player.velocity = Vector2.ZERO
	await frames(120)
	var camera := player.get_node("Camera2D") as Camera2D
	var center := camera.get_screen_center_position()
	var half_view := get_root().get_visible_rect().size * 0.5 / camera.zoom
	check(center.x <= camera.limit_right - half_view.x + 1.0 and center.x >= camera.limit_left + half_view.x - 1.0, "camera follows within room bounds")
	var standing_height := 54.0 * camera.zoom.y
	check(standing_height >= 90.0 and standing_height <= 110.0, "character display height supports readable detail")
	check(half_view.x * 2.0 > player.run_speed * 0.87 * 2.0, "camera retains room to anticipate a running jump")
	player.position = Vector2(1000, 950)
	player.velocity = Vector2(0, 800)
	await frames(60)
	check(absf(player.position.x - 140.0) < 2.0 and player.is_on_floor(), "pit recovery restores safe spawn")
	player.position = Vector2(1500, 300)
	Input.action_press("okto_reset")
	await frames(1)
	Input.action_release("okto_reset")
	await frames(60)
	check(absf(player.position.x - 140.0) < 2.0 and player.is_on_floor(), "manual reset restores safe spawn")

	var sprite := player.get_node("AnimatedSprite2D") as AnimatedSprite2D
	check(sprite.animation == "idle" and sprite.is_playing(), "idle animation at rest")
	check(sprite.sprite_frames.get_frame_count("idle") == 8 and sprite.sprite_frames.get_frame_count("walk") == 8 and sprite.sprite_frames.get_frame_count("run") == 8, "three eight-frame animation atlases")
	var shift_event := InputMap.action_get_events("okto_run")[0] as InputEventKey
	check(shift_event.physical_keycode == KEY_SHIFT, "run bound to physical Shift")
	player.position = Vector2(2500, 620)
	player.velocity = Vector2.ZERO
	await frames(5)
	Input.action_press("okto_left")
	await frames(20)
	check(sprite.animation == "walk" and sprite.flip_h, "walk animation faces left")
	Input.action_press("okto_run")
	await frames(1)
	check(absf(player.velocity.x) < player.run_speed, "run builds speed gradually")
	await frames(11)
	check(absf(player.velocity.x) > player.speed + 50.0 and sprite.animation == "run", "Shift accelerates and switches to run")
	Input.action_release("okto_run")
	await frames(12)
	check(absf(absf(player.velocity.x) - player.speed) < 1.0 and sprite.animation == "walk", "releasing Shift returns to walk speed and animation")
	Input.action_release("okto_left")
	await frames(20)
	Input.action_press("okto_run")
	await frames(10)
	check(absf(player.velocity.x) < 1.0 and sprite.animation == "idle", "Shift alone does not move Okto")
	Input.action_release("okto_run")
	var full_jump := await measure_jump(player, 100)
	var short_jump := await measure_jump(player, 3)
	print("JUMP METRICS: held=%s, tap=%s (height px, airtime s)" % [full_jump, short_jump])
	check(full_jump.x > 100.0 and full_jump.x < 125.0, "held jump clears greybox platform height")
	check(full_jump.y > 0.7 and full_jump.y < 1.0, "jump has bounded airtime with heavier descent")
	check(short_jump.x < full_jump.x * 0.7, "short press produces a lower jump")
	player.position = Vector2(840, 620)
	player.velocity = Vector2.ZERO
	await frames(5)
	Input.action_press("okto_right")
	Input.action_press("okto_run")
	player.velocity.x = player.run_speed
	Input.action_press("okto_jump")
	await frames(55)
	check(player.position.x > 1060.0 and player.is_on_floor(), "running jump crosses the greybox pit")
	Input.action_release("okto_right")
	Input.action_release("okto_run")
	Input.action_release("okto_jump")
	print("PROTOTYPE CHECKS: %d failures" % failures)
	quit(0 if failures == 0 else 1)
