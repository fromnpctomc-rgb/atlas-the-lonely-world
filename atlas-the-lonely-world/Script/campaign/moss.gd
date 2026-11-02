extends CharacterBody2D
## Physical placeholder companion. Repositioning is owned by checkpoint/scene restore only.
var player: CharacterBody2D
var graph := AStar2D.new()
var goal := Vector2.ZERO
var cooperating := false
var state := "FOLLOW"
var arrived := false
var jump_cooldown := 0.0
var age := 0.0
var stalled := 0.0
var last_x := 0.0
var route := PackedVector2Array()
var route_index := 1
var route_goal := Vector2(-9999,-9999)
var route_age := 0.0
var drop_time := 0.0

func _ready() -> void:
	collision_layer = 4
	collision_mask = 2
	var shape := CollisionShape2D.new()
	var capsule := CapsuleShape2D.new()
	capsule.radius = 11
	capsule.height = 30
	shape.shape = capsule
	shape.position.y = -15
	add_child(shape)

func set_navigation(points: Array) -> void:
	graph.clear()
	for i in points.size():
		graph.add_point(i, points[i])
	for i in points.size():
		for j in range(i + 1, points.size()):
			var d: Vector2 = points[j] - points[i]
			if absf(d.x) < 210 and absf(d.y) < 85:
				graph.connect_points(i, j)

func probe(from: Vector2, to: Vector2) -> Dictionary:
	return get_world_2d().direct_space_state.intersect_ray(PhysicsRayQueryParameters2D.create(from, to, 2))

func _physics_process(delta: float) -> void:
	if not is_instance_valid(player):
		return
	age += delta
	route_age += delta
	jump_cooldown = maxf(0, jump_cooldown - delta)
	var target := goal if cooperating else player.global_position
	drop_time = maxf(0,drop_time-delta)
	if is_on_floor() and target.y>position.y+80 and absf(target.x-position.x)>70:
		drop_time = .35
	collision_mask = 0 if drop_time>0 else 2
	var distance := global_position.distance_to(target)
	arrived = distance < 35 and is_on_floor()
	var next := target
	if graph.get_point_count() > 0:
		if route.is_empty() or (is_on_floor() and (route_goal.distance_to(target)>100 or stalled>2 or route_age>2.5)):
			route = graph.get_point_path(graph.get_closest_point(position), graph.get_closest_point(target))
			route_goal = target
			route_index = 1
			route_age = 0
		if route_index < route.size():
			next = route[route_index]
			if is_on_floor() and absf(next.x-position.x)<30 and position.y<=next.y+8:
				route_index += 1
				route_age = 0
				next = route[route_index] if route_index<route.size() else target
	var stop := 24.0 if cooperating else 65.0
	var axis := signf(next.x - position.x) if distance > stop else 0.0
	state = "COOP_ACT" if cooperating else ("FOLLOW" if axis != 0 else "OBSERVE")
	if axis != 0 and is_on_floor() and drop_time == 0:
		var front := position + Vector2(axis * 25, -16)
		var wall := not probe(front, front + Vector2(axis * 10, 0)).is_empty() or not probe(position+Vector2(0,-5),position+Vector2(axis*35,-5)).is_empty()
		var floor_ahead := not probe(position + Vector2(axis * 27, -10), position + Vector2(axis * 27, 55)).is_empty()
		if jump_cooldown == 0 and (wall or not floor_ahead or (next.y < position.y - 20 and absf(next.x-position.x) < 95)):
			velocity.y = -470
			jump_cooldown = 0.45
	velocity.x = move_toward(velocity.x, axis * (240 if distance > 200 else 170), 1300 * delta)
	velocity.y = minf(velocity.y + (1000 if velocity.y < 0 else 1700) * delta, 800)
	move_and_slide()
	stalled = stalled + delta if axis != 0 and absf(position.x - last_x) < 0.1 else 0
	last_x = position.x
	if stalled > 2:
		state = "WAIT_SAFE"
	queue_redraw()

func _draw() -> void:
	var bob := sin(age * (9 if absf(velocity.x)>10 else 2)) * 1.4
	draw_colored_polygon(PackedVector2Array([Vector2(-16,-5),Vector2(-15,-22+bob),Vector2(-7,-32+bob),Vector2(9,-30+bob),Vector2(17,-17+bob),Vector2(14,-4)]), Color("8a9e7b"))
	draw_line(Vector2(-10,-20+bob),Vector2(2,-26+bob),Color("bdc5a3"),3)
	var face := 1 if not is_instance_valid(player) or player.position.x >= position.x else -1
	draw_circle(Vector2(8*face,-19+bob),2,Color("242f32"))
	draw_rect(Rect2(-12,-5,9,5),Color("596b60"))
	draw_rect(Rect2(5,-5,9,5),Color("596b60"))
	if state == "WAIT_SAFE":
		draw_arc(Vector2(0,-43),5,0,PI,12,Color("efd9a3"),2)

