extends CharacterBody2D
## Movement values are prototype tuning. Art supplied by the Game Director.
@export var speed: float = 135.0
@export var run_speed: float = 240.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var acceleration: float = 1200.0
@export var run_acceleration: float = 1500.0
@export var braking: float = 1800.0
@export var turn_acceleration: float = 1900.0
@export var air_acceleration: float = 540.0
@export var jump_speed: float = 360.0
@export var gravity: float = 1550.0
@export var fall_gravity: float = 1850.0
@export var spawn_position := Vector2(140, 540)
var coyote_time: float = 0.0
var jump_buffer: float = 0.0
var facing: float = 1.0
var hanging := false
var ledge_target := Vector2.ZERO
var climbing := false
var climb_from := Vector2.ZERO
var climb_progress := 0.0
var can_jump := true

func _ready() -> void:
	update_animation()

func _physics_process(delta: float) -> void:
	if climbing:
		climb_progress = minf(1.0, climb_progress + delta / 0.24)
		var desired := Vector2(climb_from.x,lerpf(climb_from.y,ledge_target.y,smoothstep(0.0,.7,climb_progress)))
		if climb_progress>.7:
			desired.x=lerpf(climb_from.x,ledge_target.x,smoothstep(.7,1.0,climb_progress))
		if test_move(global_transform, desired - global_position):
			climbing = false
			return
		global_position = desired
		if climb_progress >= 1.0:
			climbing = false
			velocity = Vector2.ZERO
		return
	if hanging:
		velocity = Vector2.ZERO
		if Input.is_action_just_pressed("atlas_climb") or Input.is_action_just_pressed("okto_jump"):
			hanging = false
			climbing = true
			climb_from = global_position
			climb_progress = 0.0
		elif Input.is_action_just_pressed("atlas_drop"):
			hanging = false
			global_position.x -= facing * 16
		return
	coyote_time = 0.10 if is_on_floor() else maxf(0.0, coyote_time - delta)
	jump_buffer = maxf(0.0, jump_buffer - delta)
	if Input.is_action_just_pressed("okto_jump"):
		jump_buffer = 0.12
	var axis := Input.get_axis("okto_left", "okto_right")
	var sprinting := Input.is_action_pressed("okto_run")
	var target := axis * (run_speed if sprinting else speed)
	var rate := run_acceleration if sprinting else acceleration
	if axis == 0.0 or absf(velocity.x) > absf(target):
		rate = braking
	elif axis * velocity.x < 0.0:
		rate = turn_acceleration
	if not is_on_floor():
		rate = air_acceleration
	velocity.x = move_toward(velocity.x, target, rate * delta)
	if axis != 0.0:
		facing = signf(axis)
	if not is_on_floor():
		var vertical_gravity := gravity if velocity.y < 0.0 else fall_gravity
		velocity.y = minf(velocity.y + vertical_gravity * delta, 800.0)
	if can_jump and jump_buffer > 0.0 and coyote_time > 0.0:
		velocity.y = -jump_speed
		jump_buffer = 0.0
		coyote_time = 0.0
	move_and_slide()
	if has_meta("campaign") and not is_on_floor() and velocity.y > 0 and (is_on_wall() or absf(axis)>0):
		try_ledge_grab()
	if not has_meta("campaign") and (global_position.y > 1000.0 or Input.is_action_just_pressed("okto_reset")):
		reset_to_spawn()
	update_animation()

func reset_to_spawn() -> void:
	hanging = false
	climbing = false
	global_position = spawn_position
	velocity = Vector2.ZERO
	coyote_time = 0.0
	jump_buffer = 0.0
	$Camera2D.reset_smoothing()

func update_animation() -> void:
	var anim := "idle"
	if absf(velocity.x) > 5.0:
		anim = "run" if absf(velocity.x) > speed + 20.0 else "walk"
	if not is_on_floor():
		anim = "walk" # Temporary airborne pose until a jump sheet is supplied.
	sprite.play(anim)
	# Match cadence to actual travel speed during acceleration and braking.
	sprite.speed_scale = 1.0 if anim == "idle" else clampf(absf(velocity.x) / (run_speed if anim == "run" else speed), 0.45, 1.15)
	if not is_on_floor():
		sprite.set_frame_and_progress(0, 0.0)
		sprite.pause()
	sprite.flip_h = facing < 0.0
	# Fixed source-to-world scale; running posture must not resize the whole actor.
	var factor := float(sprite.sprite_frames.get_meta("idle_scale"))
	var baseline := float(sprite.sprite_frames.get_meta(anim + "_baseline"))
	var tex := sprite.sprite_frames.get_frame_texture(anim, 0)
	sprite.scale = Vector2.ONE * factor
	sprite.offset = Vector2(0, tex.get_height() * 0.5 - baseline)

func try_ledge_grab() -> void:
	var space := get_world_2d().direct_space_state
	var front := global_position + Vector2(facing*19,-85)
	var hit := space.intersect_ray(PhysicsRayQueryParameters2D.create(front,front+Vector2(0,65),2))
	if hit.is_empty() or not hit.collider.is_in_group("grabbable"):
		return
	var candidate: Vector2 = hit.position + Vector2(facing*18,-2)
	var params := PhysicsShapeQueryParameters2D.new()
	params.shape = $CollisionShape2D.shape
	params.transform = Transform2D(0,candidate+Vector2(0,-27))
	params.collision_mask = 2
	if not space.intersect_shape(params).is_empty():
		return
	ledge_target = candidate
	global_position = Vector2(hit.position.x-facing*19,hit.position.y+23)
	hanging = true
	velocity = Vector2.ZERO
