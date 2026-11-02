extends SceneTree
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var game = load("res://Scene/campaign/campaign.tscn").instantiate()
	root.add_child(game)
	await process_frame
	game.open_area(11)
	game.area.okto.position = Vector2(1450,558)
	game.area.okto.get_node("Camera2D").reset_smoothing()
	await create_timer(1).timeout
	await RenderingServer.frame_post_draw
	root.get_texture().get_image().save_png("res://tests/echoing_ruins_preview.png")
	quit()
