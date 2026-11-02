extends StaticBody2D
signal state_changed(id: String, state: int)
enum State { STABLE, CONTACT_REACT, WARNING, FAILING, SETTLED }
@export var surface_id := ""
@export var warning_duration := 1.2
@export var settle_drop := 70.0
@export var span := 90.0
@export var scripted_only := false
var actor: CharacterBody2D
var state := State.STABLE
var clock := 0.0
var origin := Vector2.ZERO
var shape: CollisionShape2D
var sound: AudioStreamPlayer2D

func _ready() -> void:
	origin=position
	collision_layer=2
	collision_mask=0
	add_to_group("grabbable")
	shape=CollisionShape2D.new()
	var box:=RectangleShape2D.new()
	box.size=Vector2(span,16)
	shape.shape=box
	shape.position=Vector2(span/2,8)
	add_child(shape)
	sound=AudioStreamPlayer2D.new()
	var sample:=AudioStreamWAV.new()
	sample.format=AudioStreamWAV.FORMAT_16_BITS
	sample.mix_rate=22050
	var bytes:=PackedByteArray()
	bytes.resize(4410)
	for i in 2205:
		var value:=sin(i*1.7)*sin(i*.13)*exp(-float(i)/450)*9000
		bytes.encode_s16(i*2,int(value))
	sample.data=bytes
	sound.stream=sample
	sound.volume_db=-14
	add_child(sound)

func trigger() -> void:
	if state!=State.STABLE:
		return
	change_state(State.CONTACT_REACT)

func change_state(next: int) -> void:
	state=next
	clock=0
	state_changed.emit(surface_id,state)
	if state==State.FAILING:
		remove_from_group("grabbable")
		shape.set_deferred("disabled",true)
		sound.play()
	queue_redraw()

func restore_settled() -> void:
	state=State.SETTLED
	position=origin+Vector2(0,settle_drop)
	shape.set_deferred("disabled",false)
	remove_from_group("grabbable")
	rotation=0
	queue_redraw()

func reset_surface() -> void:
	state=State.STABLE
	clock=0
	position=origin
	rotation=0
	shape.set_deferred("disabled",false)
	if not is_in_group("grabbable"):
		add_to_group("grabbable")
	queue_redraw()

func _physics_process(delta: float) -> void:
	clock+=delta
	if state==State.STABLE and not scripted_only and is_instance_valid(actor):
		if actor.is_on_floor() and actor.position.x>origin.x-8 and actor.position.x<origin.x+span+8 and absf(actor.position.y-origin.y)<5:
			trigger()
	elif state==State.CONTACT_REACT and clock>=.08:
		change_state(State.WARNING)
	elif state==State.WARNING:
		rotation=sin(clock*17)*.012
		if clock>=warning_duration:
			change_state(State.FAILING)
	elif state==State.FAILING:
		position.y=origin.y+minf(settle_drop,clock*clock*500)
		if position.y>=origin.y+settle_drop:
			restore_settled()
			state_changed.emit(surface_id,state)
	if state!=State.STABLE:
		queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(0,0,span,16),Color("9c8870") if state<State.FAILING else Color("706c62"))
	draw_line(Vector2.ZERO,Vector2(span,0),Color("d6c79e"),2)
	var crack:=clampf(clock/maxf(warning_duration,.1),.2,1) if state==State.WARNING else .2
	draw_polyline(PackedVector2Array([Vector2(span*.3,0),Vector2(span*.4,12*crack),Vector2(span*.55,3),Vector2(span*.7,14*crack)]),Color("302c2b"),2)
	if state in [State.WARNING,State.FAILING]:
		for i in 7:
			draw_circle(Vector2(span*(i+1)/8,18+fmod(clock*35+i*9,45)),1.5,Color("aa9a7a"))
