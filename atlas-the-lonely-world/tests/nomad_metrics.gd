extends SceneTree
func _initialize() -> void: call_deferred("run")
func run() -> void:
	var world=load("res://Scene/nomad/world.tscn").instantiate()
	world.save_path="user://nomad_metrics_only.json"
	root.add_child(world)
	await physics_frame
	world.set_physics_process(false)
	var actor=world.okto
	actor.set_physics_process(true)
	for sprint in [false,true]:
		actor.position=Vector2(150,1198)
		actor.velocity=Vector2.ZERO
		Input.action_press("okto_right")
		if sprint: Input.action_press("okto_run")
		for i in 20: await physics_frame
		var start: Vector2=actor.position
		var apex: float=start.y
		Input.action_press("okto_jump")
		var frames:=0
		for i in 120:
			await physics_frame
			frames+=1
			apex=minf(apex,actor.position.y)
			if i>3 and actor.is_on_floor(): break
		Input.action_release("okto_jump")
		Input.action_release("okto_right")
		Input.action_release("okto_run")
		print("METRIC ","run" if sprint else "walk"," apex_px=",start.y-apex," reach_px=",actor.position.x-start.x," flight_s=",frames/60.0)
	for test in [[Vector2(3600,1118),"nomad_crouch",1],[Vector2(4100,1118),"nomad_crawl",2]]:
		actor.position=test[0]
		actor.velocity=Vector2.ZERO
		Input.action_press(test[1])
		for i in 12: await physics_frame
		Input.action_release(test[1])
		for i in 12: await physics_frame
		if actor.posture!=test[2]:
			print("FAIL ceiling clearance ",test[1]); quit(1); return
		print("PASS blocked stand-up ",test[1]," height=",actor.stance_height)
	actor.position=Vector2(5200,1118)
	for i in 12: await physics_frame
	if actor.posture!=0:
		print("FAIL cave exit stand");quit(1);return
	print("PASS stand after cave")
	quit()
