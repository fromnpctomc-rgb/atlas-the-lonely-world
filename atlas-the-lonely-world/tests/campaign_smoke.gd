extends SceneTree
var failures := 0
func check(value: bool, message: String) -> void:
	print(("PASS " if value else "FAIL ")+message)
	if not value:
		failures += 1

func _initialize() -> void:
	call_deferred("run")

func run() -> void:
	var game = load("res://Scene/campaign/campaign.tscn").instantiate()
	root.add_child(game)
	await process_frame
	# Redirect all automated checkpoint writes away from the user's progress.
	var original_save := "user://atlas_greybox_v1.json"
	var backup := FileAccess.get_file_as_bytes(original_save) if FileAccess.file_exists(original_save) else PackedByteArray()
	for i in 14:
		game.stages = {}
		game.open_area(i)
		await physics_frame
		await physics_frame
		var a = game.area
		check(is_instance_valid(a.okto),"A%02d instantiates" % (i+1))
		check((a.moss != null)==(i>=5),"A%02d companion encounter ordering" % (i+1))
		check(a.nav_points.size()>40,"A%02d physical navigation anchors" % (i+1))
		if a.gate != null:
			a.set_stage(1)
			await physics_frame
			check(not a.gate.get_node("CollisionShape2D").disabled,"A%02d unfinished gate remains closed" % (i+1))
			a.set_stage(3)
			await physics_frame
			await physics_frame
			check(a.gate.get_node("CollisionShape2D").disabled,"A%02d completed gate opens" % (i+1))
		Input.action_press("okto_right")
		Input.action_press("okto_run")
		for frame in 1600:
			Input.action_release("atlas_climb")
			if a.okto.hanging:
				Input.action_press("atlas_climb")
			if frame%48 == 0:
				Input.action_press("okto_jump")
			if frame%48 == 2:
				Input.action_release("okto_jump")
			if a.okto.position.x>2770:
				Input.action_release("okto_right")
			await physics_frame
		Input.action_release("okto_right")
		Input.action_release("okto_run")
		Input.action_release("okto_jump")
		Input.action_release("atlas_climb")
		check(a.okto.position.x>2700,"A%02d actual player traversal (x=%.0f)" % [i+1,a.okto.position.x])
		if a.moss != null:
			if a.moss.position.x<2600:
				print("EXIT DEBUG ",i," ",a.moss.position," ",a.moss.route," next ",a.moss.route_index)
			check(a.moss.position.x>2600,"A%02d companion reaches exit (x=%.0f)" % [i+1,a.moss.position.x])
	game.open_area(7)
	await physics_frame
	var a = game.area
	# Real physics companion crossing, with a stationary destination on the same spine.
	a.okto.position = Vector2(1200,560)
	a.okto.set_physics_process(false)
	for frame in 900:
		await physics_frame
	print("MOSS DEBUG ",a.moss.position," velocity ",a.moss.velocity," state ",a.moss.state," route ",a.moss.graph.get_point_path(a.moss.graph.get_closest_point(a.moss.position),a.moss.graph.get_closest_point(a.okto.position)))
	print("CACHE ",a.moss.route," NEXT ",a.moss.route_index)
	check(a.moss.position.x>1050,"Moss physically follows across first terrain modules (x=%.1f)" % a.moss.position.x)
	check(a.moss.position.y<780,"Moss remains on a physical surface")
	for id in range(4,14):
		game.stages = {}
		game.open_area(id)
		await physics_frame
		var section = game.area
		section.okto.position = Vector2(1410,560)
		section.okto.set_physics_process(false)
		await physics_frame
		for frame in 1800:
			await physics_frame
		check(section.moss.position.x>1250,"A%02d Moss crosses physical approach (x=%.0f)" % [id+1,section.moss.position.x])
		if section.gate != null:
			Input.action_press("atlas_interact")
			for frame in 105:
				await physics_frame
			Input.action_release("atlas_interact")
			for frame in 900:
				await physics_frame
			check(section.stage==2,"A%02d physical Moss cooperation" % (id+1))
			section.okto.position = Vector2(1700,560)
			Input.action_press("atlas_interact")
			for frame in 200:
				await physics_frame
			Input.action_release("atlas_interact")
			check(section.stage==3,"A%02d hold interaction completes mechanism" % (id+1))
	game.open_area(7)
	await physics_frame
	a = game.area
	# Fixed jump apex: release must not change vertical trajectory.
	a.okto.set_physics_process(true)
	var peaks: Array = []
	for hold in [1,30]:
		a.okto.position = Vector2(2200,558)
		a.okto.velocity = Vector2.ZERO
		for frame in 15:
			await physics_frame
		Input.action_press("okto_jump")
		var peak: float = a.okto.position.y
		for frame in 75:
			if frame == hold:
				Input.action_release("okto_jump")
			await physics_frame
			peak = minf(peak,a.okto.position.y)
		Input.action_release("okto_jump")
		peaks.append(peak)
	check(absf(peaks[0]-peaks[1])<2,"Fixed jump apex on tap/hold")
	game.save_checkpoint(7,1400)
	game.load_save()
	check(game.current==7 and game.saved_x==1400,"Checkpoint round trip")
	if backup.size()>0:
		var f := FileAccess.open(original_save,FileAccess.WRITE)
		f.store_buffer(backup)
		f.close()
	else:
		DirAccess.remove_absolute(original_save)
	print("CAMPAIGN FAILURES: ",failures)
	quit(1 if failures else 0)


