# R01 rebuild milestone

Implemented after the Director's relaxed-to-medium difficulty, English-base and connected-world decisions. Full rebuild scope remains A01–A14; this milestone replaces R01 only.

Run F5, choose **R01 rebuild · connected route**. Alternatively open `Scene/prototype/connected_r01.tscn` and F6. Escape returns to the development menu. The old campaign remains available as an experimental reference, not an accepted prototype.

Three native terrain scenes under `Scene/rebuild/` contain editable StaticBody2D, CollisionPolygon2D, Polygon2D and Line2D nodes. Main route surfaces have a pale top edge; optional shelf routes use an ochre edge. Main terrain is solid; thin branch shelves allow passage from below. `tools/author_r01.py` records the hand-authored source polygons; rerunning it replaces the three terrain scene files, so preserve any manual scene edits before regeneration.

R01 uses a single persistent Okto and camera across 12,000 world units. There is no E prompt or actor respawn at A01/A02/A03 seams. Three small chunks are loaded together; this is not yet a streaming system. Moss is correctly absent in R01. A01 has a descending village lane, stepped communal terrace, optional raised pockets, small bridge gap and ridge ascent. A02 ascends to a stable observation platform, with a secondary overlook and natural marker stand-ins. A03 descends into a shadow passage and returns to a stable reveal shelf. The R02 endpoint is explicitly marked as an internal rebuild boundary.

Movement calibration remains provisional: 135 walk, 240 run, 360 jump impulse, 1550 ascent gravity, 1850 descent gravity, 54-unit body. Climb moves upward then onto the validated ledge, checking collision each step. Camera holds terrain framing during ordinary jumps rather than following each airborne vertical displacement. No final jump/climb art is claimed.

Verification: Godot 4.7.2 import and runtime load passed. `tests/rebuild_r01.gd` drove actual physics from the doorway past x=11700, visited all three areas and the horizon trigger, and verified that the actor instance remained the same. Run with `--headless --fixed-fps 60 --script res://tests/rebuild_r01.gd`. The bot uses repeated jumps and does not establish novice readability, all optional routes, accurate hand placement, emotional pacing or human acceptance.

Remaining: manual visual/gameplay review, separate all-branch and climb trials, reactive shelf tutorial, tighter alignment/concealment staging, improved inhabited detail, persistent save restoration for this new world, and the R02–R04 rebuild including companion and distinct puzzles. The previous 100-check campaign result is not a result for this rebuilt layout.
