extends SceneTree
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var world=load("res://Scene/prototype/connected_r01.tscn").instantiate()
	root.add_child(world)
	await physics_frame
	var actor=world.okto
	var original_id: int=actor.get_instance_id()
	Input.action_press("okto_right")
	Input.action_press("okto_run")
	for frame in 4200:
		if frame%45==0:
			Input.action_press("okto_jump")
		elif frame%45==2:
			Input.action_release("okto_jump")
		Input.action_release("atlas_climb")
		if actor.hanging:
			Input.action_press("atlas_climb")
		elif actor.is_on_floor():
			var query=PhysicsRayQueryParameters2D.create(actor.position+Vector2(0,-10),actor.position+Vector2(35,-10),2)
			var floor_query=PhysicsRayQueryParameters2D.create(actor.position+Vector2(35,-5),actor.position+Vector2(35,20),2)
			var space=actor.get_world_2d().direct_space_state
			if actor.is_on_wall() or not space.intersect_ray(query).is_empty() or space.intersect_ray(floor_query).is_empty():
				pass
		await physics_frame
		if actor.position.x>11700:
			break
	Input.action_release("okto_right")
	Input.action_release("okto_run")
	Input.action_release("okto_jump")
	Input.action_release("atlas_climb")
	print("R01 traversal x=",actor.position.x," y=",actor.position.y," hanging=",actor.hanging)
	print("Persistent actor=",actor.get_instance_id()==original_id,"; visited=",world.journal)
	var passed: bool=actor.position.x>11700 and actor.get_instance_id()==original_id
	print("R01 REBUILD TRAVERSAL: ","PASS" if passed else "FAIL")
	quit(0 if passed else 1)
