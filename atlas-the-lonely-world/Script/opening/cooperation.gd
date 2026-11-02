extends Node2D
signal milestone(id: String, stage: int)
@export var puzzle_id := "A05"
var stage := 0
var actor: CharacterBody2D
var companion: CharacterBody2D
var lever := Vector2.ZERO
var catch_point := Vector2.ZERO
var brace := Vector2.ZERO
var gate: StaticBody2D
var access: StaticBody2D
var rescue_gate: StaticBody2D
var hold := 0.0
var settle := 0.0
var prompt := ""

func _ready() -> void:
	lever=position+Vector2(0,-32)
	catch_point=position+Vector2(230,0)
	brace=position+Vector2(440,-32)
	# All mechanism coordinates are world coordinates, matching persistent actors.
	position=Vector2.ZERO
	access=barrier(lever+Vector2(100,-120),Vector2(18,152))
	gate=barrier(lever+Vector2(340,-550),Vector2(22,900))
	rescue_gate=barrier(lever+Vector2(620,-550),Vector2(22,900))
	apply_state()

func barrier(at: Vector2, size: Vector2) -> StaticBody2D:
	var body:=StaticBody2D.new()
	body.position=at
	body.collision_layer=2
	var shape:=CollisionShape2D.new()
	var box:=RectangleShape2D.new()
	box.size=size
	shape.shape=box
	shape.position=size/2
	body.add_child(shape)
	var visual:=Polygon2D.new()
	visual.polygon=PackedVector2Array([Vector2.ZERO,Vector2(size.x,0),size,Vector2(0,size.y)])
	visual.color=Color("806d55")
	body.add_child(visual)
	add_child(body)
	return body

func advance(value: int) -> void:
	stage=value
	hold=0
	settle=0
	apply_state()
	milestone.emit(puzzle_id,stage)

func apply_state() -> void:
	access.get_child(0).set_deferred("disabled",stage>=1)
	access.modulate.a=.15 if stage>=1 else 1
	gate.get_child(0).set_deferred("disabled",stage>=2)
	gate.modulate.a=.15 if stage>=2 else 1
	rescue_gate.get_child(0).set_deferred("disabled",stage>=4)
	rescue_gate.modulate.a=.15 if stage>=4 else 1
	queue_redraw()

func _physics_process(delta: float) -> void:
	prompt=""
	if not is_instance_valid(actor) or not is_instance_valid(companion):
		return
	if stage==0 and actor.position.distance_to(lever+Vector2(0,32))<75:
		prompt="Hold E · release the retaining brace" if puzzle_id=="A05" else "Hold E · lift the timber access"
		hold=hold+delta if Input.is_action_pressed("atlas_interact") else 0
		if hold>=1:
			advance(1)
	elif stage==1:
		companion.cooperating=true
		companion.goal=catch_point
		if companion.position.distance_to(catch_point)<28 and companion.is_on_floor():
			settle+=delta
			if settle>=.8:
				advance(2)
	elif stage==2 and actor.position.distance_to(brace+Vector2(0,32))<75:
		prompt="Hold E · secure a step for Moss" if puzzle_id=="A05" else "Hold E · secure the shared bridge"
		hold=hold+delta if Input.is_action_pressed("atlas_interact") else 0
		if hold>=1:
			advance(3)
	elif stage==3:
		companion.cooperating=true
		companion.goal=brace+Vector2(70,32)
		if companion.position.distance_to(companion.goal)<28 and companion.is_on_floor():
			settle+=delta
			if settle>=.8:
				advance(4)
	elif stage>=4:
		companion.cooperating=false
	if stage in [0,2] and prompt.is_empty():
		hold=0
	queue_redraw()

func _draw() -> void:
	for at in [lever,brace]:
		draw_line(at+Vector2(0,32),at,Color("b7aa87"),4)
		draw_line(at,at+Vector2(18 if hold>0 else -18,-12),Color("e0c58e"),4)
	draw_line(lever,catch_point-Vector2(0,20),Color("b9a87d"),2)
	draw_line(catch_point-Vector2(0,20),brace-Vector2(0,80),Color("b9a87d"),2)
	draw_rect(Rect2(catch_point-Vector2(12,30),Vector2(24,30)),Color("8fa388") if stage>=2 else Color("736e60"))
	if stage>=3:
		draw_line(brace+Vector2(0,20),brace+Vector2(180,20),Color("c5b58a"),8)
