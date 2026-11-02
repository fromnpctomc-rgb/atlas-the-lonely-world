extends SceneTree
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var world=load("res://Scene/nomad/world.tscn").instantiate()
	world.save_path="user://nomad_capture_only.json"
	root.add_child(world)
	await process_frame
	world.set_physics_process(false)
	world.okto.set_physics_process(false)
	world.okto.get_node("Camera2D").enabled=false
	for child in world.get_children():
		if child is CanvasLayer: child.hide()
	var camera:=Camera2D.new()
	root.add_child(camera)
	var folder:="res://tests/nomad_evidence"
	DirAccess.make_dir_recursive_absolute(folder)
	var shots: Array=[
		["topology",Vector2(3100,650),.27],
		["a01",Vector2(1050,1070),1.2],
		["a02_survey",Vector2(3550,520),1.5],
		["a03_left_descent",Vector2(3700,700),1.0],
		["cave",Vector2(4100,1070),1.1],
		["horizon",Vector2(5680,970),2.4]]
	for shot in shots:
		world.show_topology=shot[0]=="topology"
		world.queue_redraw()
		if shot[0]=="cave":
			world.okto.position=Vector2(4100,1119)
			world.okto.posture=2
			world.okto.stance_height=20
			world.okto.sprite.hide()
			world.okto.queue_redraw()
		elif shot[0]=="horizon":
			world.okto.position=Vector2(5500,1119)
			world.okto.posture=0
			world.okto.sprite.show()
			world.okto.queue_redraw()
		camera.position=shot[1]
		camera.zoom=Vector2.ONE*float(shot[2])
		await process_frame
		await RenderingServer.frame_post_draw
		root.get_texture().get_image().save_png(folder+"/"+shot[0]+".png")
	print("CAPTURED six implemented-scene views at ",folder)
	quit()
