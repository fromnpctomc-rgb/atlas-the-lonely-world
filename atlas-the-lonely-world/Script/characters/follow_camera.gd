extends Camera2D
## Stable terrain framing: ordinary jumps do not pull the camera up and down.
var terrain_focus := NAN
func _process(delta: float) -> void:
	var player := get_parent() as CharacterBody2D
	position.x = lerpf(position.x, player.velocity.x * 0.25, 1.0 - exp(-4.0 * delta))
	var desired := player.global_position.y-90
	if is_nan(terrain_focus) or absf(desired-terrain_focus)>400:
		terrain_focus=desired
	elif player.is_on_floor() or desired>terrain_focus+110:
		terrain_focus=lerpf(terrain_focus,desired,1.0-exp(-3.5*delta))
	position.y=terrain_focus-player.global_position.y
