# Okto sprite source (replacement set)

Provided by the Game Director on 31 October 2026. All three originals are 1774 x 887 RGBA with eight frames:
- `okto_idle.png`: ChatGPT Image Oct 31, 2026, 08_16_14 PM-1.png
- `okto_walk.png`: ChatGPT Image Oct 31, 2026, 08_16_25 PM-2.png
- `okto_run.png`: ChatGPT Image Oct 31, 2026, 08_16_33 PM-3.png

Original PNG bytes and transparency are preserved. Godot AtlasTexture regions split strips at integer eighth boundaries.
Anchor measurement ignores alpha below 0.5 so nearly invisible export residue does not shrink the character or offset its feet.
One scale and foot baseline is shared by all frames in an animation. Idle/walk height target: 54 px; running crouched pose: 46 px.
Idle/walk/run base playback: 6/10/14 fps. Moving animation cadence follows actual velocity, including acceleration and braking.
Linear mipmap filtering is enabled for painterly art, with lossless source import and generated mipmaps. Camera zoom 1.8 displays the 54-unit standing pose at approximately 97 pixels. Frame spacing and pose differences within the source remain present.
Airborne temporarily holds the first walk frame because no jump/fall sheet was supplied.

Rebuild with `--headless --path . --script res://tests/import_okto.gd` after Godot editor import.
