extends StaticBody2D
var player: CharacterBody2D
var warning_time := 1.4
var elapsed := 0.0
var triggered := false
var fallen := false
var size := Vector2(110,18)

func _physics_process(delta: float) -> void:
	if fallen or not is_instance_valid(player):
		return
	if absf(player.position.x - (position.x + size.x/2)) < size.x/2 + 8 and absf(player.position.y-position.y) < 5:
		triggered = true
	if triggered:
		elapsed += delta
		modulate = Color.WHITE.lerp(Color("df955f"), minf(elapsed/warning_time,1))
		queue_redraw()
		if elapsed >= warning_time:
			fallen = true
			$CollisionShape2D.set_deferred("disabled", true)
			var tween := create_tween()
			tween.tween_property(self,"position:y",position.y+95,0.5)
			tween.parallel().tween_property(self,"modulate:a",0.25,0.5)

func _draw() -> void:
	draw_line(Vector2(size.x*.25,1),Vector2(size.x*.5,12),Color("302e32"),2)
	draw_line(Vector2(size.x*.5,12),Vector2(size.x*.75,2),Color("302e32"),2)
