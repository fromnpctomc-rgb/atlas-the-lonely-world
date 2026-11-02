# Atlas of the Lonely World

Godot 4.7.2 · prototype 01: Okto movement, collision, camera.

## Run

Import `atlas-the-lonely-world/project.godot` into Godot, then press **F5**.
The main scene is `Scene/prototype/greybox.tscn`; it can also be opened and run with **F6**.

- A/D or Left/Right: move.
- Shift + A/D or Left/Right: accelerate to run (release Shift to walk).
- Space: jump (release early for a shorter jump).
- R: reset to the start. Falling into the pit also resets Okto.

The greybox includes raised platforms, a jumpable pit, a solid wall and camera limits.
Okto uses user-supplied idle/walk/run sprites. Room layout and movement values remain prototype tuning. Jump uses a held walk pose until jump art is supplied.
The controller includes a short jump buffer and coyote time. Camera follow uses smoothing and horizontal look-ahead.

## Movement tuning (prototype)

Walk 150 px/s, run 285 px/s. Ground acceleration 1000 px/s², run acceleration 850, braking 1500, turning 1900, air control 650.
Jump impulse 470 px/s; ascent gravity 1000 px/s² and descent gravity 1700. Releasing Space early cuts upward velocity to 48%.
Jump buffer 0.12 s, coyote time 0.10 s. Animation cadence follows travel speed rather than instantly switching pace on Shift.
On Godot 4.7.2 at 60 physics ticks/s: held jump measured ~114 px high / 0.87 s airtime; short tap ~45 px / 0.50 s.
25 automated checks passed, including a running jump across the greybox gap. Subjective game feel still needs the Director's playtest.

## Character readability and platform framing

Camera zoom is 1.8x: Okto stands about 97 screen pixels high at 1280 x 720. World collision and movement units retain their proportions.
Camera vertical offset is -90 for ground visibility and headroom. Platforms are 20 world units thick, with a 56-unit introductory step.
Painterly textures use lossless import, mipmaps and linear mipmap filtering to reduce aliasing during minification. Source PNGs remain intact.

## Source and scope

`AGENTS.md` and `docs/00_MASTER_SOURCE_v1.7.md` through `docs/06_GODOT_ENGINEERING.md`
were extracted from the supplied foundation ZIP. Master v1.7 distinguishes approved decisions from proposals.
Moss, puzzles, map, story scenes and final art/audio are outside prototype 01.

## Verification

From the Godot project directory:

```powershell
& 'C:\Users\hudallil\Downloads\Godot\Godot_v4.7.2-stable_win64_console.exe' --headless --editor --path . --quit
& 'C:\Users\hudallil\Downloads\Godot\Godot_v4.7.2-stable_win64_console.exe' --headless --path . --script res://tests/prototype_smoke.gd
```

The smoke check drives the actual physics controller and checks movement, stopping, jumping,
floor/platform/wall collision, camera bounds and automatic/manual recovery. It does not judge game feel or final visuals.

## Rollback

Changes are uncommitted. The previous project config is preserved in the ChatGPT workspace at
`Project_Horizon/atlas_stage/project.godot.before`. Restore that config and remove the newly added
prototype scene/script/test files to return to the previous project baseline.
