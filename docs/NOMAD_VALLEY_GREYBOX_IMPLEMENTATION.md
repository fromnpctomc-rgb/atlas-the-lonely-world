# Nomad Valley greybox implementation — 2026-11-02

## Scope and source reconciliation

Latest Nomad Valley handoff supersedes the previous A01–A07 directive for this task. Implemented scope is New Game / A01–A03 / R02 threshold, with no Moss. The reference illustration supplies readability and mood; its rightward descent is not used as collision topology. The current route is physically RIGHT+UP, LEFT+DOWN, RIGHT through a cave.

Canonical project remains `atlas-the-lonely-world/project.godot` in the existing Atlas repository. Engine verified by executable: `4.7.2.stable.official.ed1daf0bf`. GL Compatibility, 1920×1080 design viewport, 1280×720 window override. Existing input actions, controller, sprite resources and camera are reused. No autoload was added. Prior local changes were already uncommitted/untracked; they were preserved. A pre-edit ZIP backup is under `docs/backups/before_nomad_*.zip`. No commit or push was performed.

## Run

F5 → **New Game** now runs `Scene/nomad/main.tscn`, not the old campaign menu. Direct scene: `Scene/nomad/world.tscn`; editable geometry: `Scene/nomad/terrain.tscn`. Terrain is native StaticBody2D/CollisionPolygon2D/Polygon2D geometry. `tools/author_nomad.py` is its authoring source; running it overwrites only that generated terrain scene, so preserve manual editor edits before regeneration.

Controls: A/D or arrows move; Shift run; Space fixed-height jump; W/Space climb a grabbed lip; S release; Ctrl crouch; C crawl; Q contextual Survey; Tab observed journal; R checkpoint; Esc menu. F3 toggles developer text, topology direction arrows and collision hints; off by default. Three-second safe opening text is an explicitly temporary handoff sequence, not a finished cinematic.

## Measured calibration

Standing capsule is 54 world units = 1 CU, crouch 36, crawl 20; capsule radius 10. Feet stay at the same origin. Scale is fixed using idle source scale, not resized by posture. Crouch/crawl use honest geometric posture silhouettes while the supplied standing sheets remain intact. Final crouch/crawl art is absent.

Godot physics measurements at 60 Hz: walk 135, run 240; jump apex **44.83 px = 0.83 CU**; flat walk-jump reach **65.25 px**; run-jump reach **116.00 px**; airtime **0.483 s**. Acceleration settings: walk 1200, run 1500, brake 1800, air 540. Coyote 0.10 s, buffer 0.12 s. These are prototype tuning, not canon or human-approved feel. Ordinary planned unbridged gaps should use about 36–49 walk units or 64–87 run units. Existing 55-unit hazard openings are initially bridged and have lower recoveries.

Camera normal zoom 4 gives 270 world units of vertical view at 1080 design height, making the 54-unit standing body 20%. Terrain-focused vertical framing avoids following every jump. Horizontal look-ahead uses signed velocity, including LEFT descent. Survey/reveal temporarily widen then return. Before reveal, camera right limit is 5400; at the cave exit it extends to 6200. Both normal framing and cinematic legibility still require human review.

## Physical route / coordinates

| Module | Implemented coordinates / consequence |
|---|---|
| A01 start | (110,1198), house floor y1200; village rises toward x2250, y~940 |
| Ascent | Editable ribbons progress to x3500,y610; low steps and one 62-unit lip add jump/hand-reach work among ramps |
| A02 tutorial | x3700–3755,y550, initial bridge; 1.25s warning; lower recovery at y620 |
| Survey | x3430 vicinity; distinct split/leaning/broad rock silhouettes; upper alternative; actual lower fracture route under an overhang near x3930–4150 |
| Higher crest | x4700–4780,y300; upper path ends so the next physical surface is below and back LEFT |
| Leftward descent | x4850,y400 → x4000,y660 → x3300,y860 → x2750,y960; a final ledge at x2600–2750,y1020 drops to the left-side cave mouth |
| Cave mouth | x2450–2900,y1120 floor. Player turns RIGHT beneath the separately layered descent |
| Standing cave | x2900–3400, ceiling y1040, 80-unit headroom |
| Crouch passage | x3400–3900, ceiling y1080, 40-unit headroom; standing 54 is blocked |
| Crawl squeeze | x3900–4500, ceiling y1096, 24-unit headroom; crawl 20 fits with 4-unit tolerance |
| Exit transition | crouch x4500–5000, standing x5000–5400, then open stable ledge |
| A03 masonry | x3450–3505,y1120; 1.2s warning; lower recovery y1180 |
| Horizon / R02 | reveal after x5400; checkpoint (5500,1118); completion threshold x6000; scope boundary at6190 |

Reactive surfaces reuse `Script/opening/reactive_surface.gd`, with explicit STABLE → CONTACT_REACT → WARNING → FAILING → SETTLED, visual crack/micro-tilt/debris, procedural impact support sound, collision removed at FAILING and returned for settled debris. Resettable surfaces restore on checkpoint; important settled state persists in flags.

Survey states are 0 unobserved, 1 available, 2 viewed, 3 route found by location, 4 crest/complete. Q only reframes existing geometry and logs an observation; it opens no door. The current puzzle is a spatial blockout and still needs first-time-player testing of alignment and route readability.

Checkpoints: house, end-of-village ascent (2250,938), crest (4420,378), cave mouth (2500,1118), post-reveal (5500,1118). Separate save `user://atlas_nomad_v3.json` stores schema, safe position, route phase, Survey, journal and structural/reveal flags. Continue restores this save; original experimental saves remain separate. Route phase is not inferred solely from X, because ascent/descent/cave overlap horizontally.

## Modified/added systems

- `Script/nomad/menu.gd`, `world.gd`, `player.gd`: English menu, continuous route/Survey/checkpoints, collision postures with stand-up clearance.
- `Scene/nomad/main.tscn`, `world.tscn`, `terrain.tscn`: current runtime and editor geometry.
- `Script/opening/reactive_surface.gd`: reusable hazard; added deterministic local reset.
- `Script/characters/okto.gd`: reusable jump permission for low postures; existing scale/camera/controller retained.
- `tests/nomad_journey.gd`, `nomad_metrics.gd`, `nomad_capture.gd`: actual runtime tests and screenshots.
- `project.godot`: current main scene; Ctrl/C/F3 actions.

## Remaining production limits

This is a functional greybox iteration, not final acceptance of feel/pacing. Automated traversal is shorter than the 10–12-minute novice gameplay target; that target is NOT claimed met. Mountain/village detail, soundscape, final cinematics and posture animation remain temporary. The alignment puzzle, all alternate-route returns, deliberate shortcut attempts, ledge precision, controlled descent and first-time-player left-turn recognition still need broader interactive playtests. No finished art/audio or perfect gameplay claim is made.
