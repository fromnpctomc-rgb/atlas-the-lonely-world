extends SceneTree
var failures:=0
func check(value: bool,text: String) -> void:
	print(("PASS " if value else "FAIL ")+text)
	if not value: failures+=1
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var menu=load("res://Scene/nomad/main.tscn").instantiate()
	root.add_child(menu)
	await process_frame
	menu.begin(false)
	var world=menu.world
	world.save_path="user://nomad_automated_test.json"
	for i in 200: await physics_frame
	var actor=world.okto
	var stage:=0
	var initial_id: int=actor.get_instance_id()
	for frame in 10000:
		Input.action_release("atlas_climb")
		if actor.hanging: Input.action_press("atlas_climb")
		if stage==0 and actor.position.x>4800 and actor.position.y>330:
			stage=1
		if stage==1 and actor.position.x<2500 and actor.position.y>1080:
			stage=2
		Input.action_release("okto_left")
		Input.action_release("okto_right")
		Input.action_press("okto_left" if stage==1 else "okto_right")
		Input.action_press("okto_run")
		Input.action_release("nomad_crouch")
		Input.action_release("nomad_crawl")
		if stage==2:
			if actor.position.x>3800 and actor.position.x<4570: Input.action_press("nomad_crawl")
			elif actor.position.x>3300 and actor.position.x<5050: Input.action_press("nomad_crouch")
		if frame%45==0 and stage==0: Input.action_press("okto_jump")
		if frame%45==2: Input.action_release("okto_jump")
		await physics_frame
		if world.completed: break
	for key in ["okto_left","okto_right","okto_run","okto_jump","nomad_crouch","nomad_crawl","atlas_climb"]: Input.action_release(key)
	print("FINAL ",actor.position," phase ",world.phase," stage ",stage," stance ",actor.posture)
	check(world.completed,"house → right ascent → left descent → right cave → R02 threshold")
	check(actor.get_instance_id()==initial_id,"persistent actor, no scene-boundary teleport")
	check(world.survey==4,"observation route completed without opening map")
	check(world.flags.get("horizon",false),"reveal at cave exit")
	check(actor.posture==0,"clearance permits standing after cave")
	var saved=world.snapshot()
	world.restore(saved)
	await physics_frame
	check(actor.position.distance_to(world.checkpoint)<8,"checkpoint restoration")
	var surface=world.hazards.brittle
	surface.trigger()
	for i in 140: await physics_frame
	check(surface.state==4,"reactive hazard completes explicit states")
	check(not surface.shape.disabled,"settled debris remains a physical surface")
	DirAccess.remove_absolute(world.save_path)
	print("FAILURES ",failures)
	quit(0 if failures==0 else 1)
