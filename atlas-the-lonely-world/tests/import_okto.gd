extends SceneTree
## Rebuild atlas resources from the three original, unmodified user sheets.
func _initialize() -> void:
	var frames := SpriteFrames.new()
	frames.remove_animation("default")
	for anim in ["idle", "walk", "run"]:
		var path := "res://Assets/art/okto/okto_%s.png" % anim
		var atlas := load(path) as Texture2D
		var image := atlas.get_image()
		# Ignore nearly invisible export residue outside the painted character.
		# This only measures atlas anchors; source pixels are never changed.
		var minimum := Vector2i(image.get_width(), image.get_height())
		var maximum := Vector2i.ZERO
		for y in range(image.get_height()):
			for x in range(image.get_width()):
				if image.get_pixel(x, y).a >= 0.5:
					minimum = minimum.min(Vector2i(x, y))
					maximum = maximum.max(Vector2i(x + 1, y + 1))
		var bounds := Rect2i(minimum, maximum - minimum)
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, {"idle": 6.0, "walk": 10.0, "run": 14.0}[anim])
		for i in range(8):
			var left := floori(float(image.get_width()) * i / 8.0)
			var right := floori(float(image.get_width()) * (i + 1) / 8.0)
			var frame := AtlasTexture.new()
			frame.atlas = atlas
			frame.region = Rect2(left, 0, right - left, image.get_height())
			frames.add_frame(anim, frame)
		# Shared scale and baseline for all frames within each animation.
		var display_height := 46.0 if anim == "run" else 54.0
		frames.set_meta(anim + "_scale", display_height / bounds.size.y)
		frames.set_meta(anim + "_baseline", bounds.end.y)
		print("ATLAS %s: %s bounds=%s, 8 frames" % [anim, image.get_size(), bounds])
	var error := ResourceSaver.save(frames, "res://Assets/art/okto/okto_frames.tres")
	quit(0 if error == OK else 1)
