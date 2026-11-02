extends "res://Script/characters/okto.gd"
enum Posture { STAND, CROUCH, CRAWL }
var posture := Posture.STAND
var stance_height := 54.0
var full_speed := 135.0
var regrab := 0.0

func _ready() -> void:
	$CollisionShape2D.shape=$CollisionShape2D.shape.duplicate()
	super._ready()

func clear_for(height: float) -> bool:
	var capsule:=CapsuleShape2D.new()
	capsule.radius=10
	capsule.height=height
	var query:=PhysicsShapeQueryParameters2D.new()
	query.shape=capsule
	query.transform=Transform2D(0,global_position+Vector2(0,-height/2-.5))
	query.collision_mask=2
	query.exclude=[get_rid()]
	return get_world_2d().direct_space_state.intersect_shape(query).is_empty()

func _physics_process(delta: float) -> void:
	regrab=maxf(0,regrab-delta)
	var wanted: int=Posture.CRAWL if Input.is_action_pressed("nomad_crawl") else (Posture.CROUCH if Input.is_action_pressed("nomad_crouch") else Posture.STAND)
	var heights: Array[float]=[54.0,36.0,20.0]
	if heights[wanted]<=stance_height or clear_for(heights[wanted]):
		posture=wanted
		stance_height=heights[posture]
		$CollisionShape2D.shape.radius=10
		$CollisionShape2D.shape.height=stance_height
		$CollisionShape2D.position.y=-stance_height/2
	speed=[full_speed,75.0,40.0][posture]
	can_jump=posture==Posture.STAND
	run_speed=240 if posture==Posture.STAND else speed
	if posture!=Posture.STAND:
		jump_buffer=0
		coyote_time=0
	super._physics_process(delta)
	if Input.is_action_just_pressed("atlas_drop"):
		regrab=.35
	sprite.visible=posture==Posture.STAND
	queue_redraw()

func try_ledge_grab() -> void:
	if posture==Posture.STAND and regrab==0:
		super.try_ledge_grab()

func reset_to_spawn() -> void:
	super.reset_to_spawn()
	regrab=.3

func _draw() -> void:
	if posture==Posture.STAND:
		return
	# Fixed-scale posture silhouette until authored crouch/crawl frames are available.
	var h:=stance_height
	draw_rect(Rect2(-12,-h+3,24,h-8),Color("344453"))
	draw_circle(Vector2(7*facing,-h+7),7,Color("b5987a"))
	draw_rect(Rect2(-15,-h+7,12,12),Color("71543e"))
	draw_line(Vector2(-12,-3),Vector2(13,-3),Color("b9ad92"),4)
