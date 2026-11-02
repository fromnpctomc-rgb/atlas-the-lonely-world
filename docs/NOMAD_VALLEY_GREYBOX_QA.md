# Nomad Valley QA — 2026-11-02

Executable: `C:\Users\hudallil\Downloads\Godot\Godot_v4.7.2-stable_win64_console.exe`; actual `--version`: `4.7.2.stable.official.ed1daf0bf`.

Commands executed from `atlas-the-lonely-world`:

```powershell
& <godot-console> --headless --path . --editor --import --quit
& <godot-console> --headless --fixed-fps 60 --path . --script res://tests/nomad_metrics.gd
& <godot-console> --headless --fixed-fps 60 --path . --script res://tests/nomad_journey.gd
& <godot-console> --path . --script res://tests/nomad_capture.gd
```

## Observed results

- Project import / script registration completed without blocking errors.
- Actual New Game menu → safe opening → physical RIGHT ascent → LEFT descent → RIGHT crouch/crawl cave → R02 threshold: PASS. Last verified position (6007.44,1119.934), phase3. Test drives real input and physics; no route-progress teleport is used.
- Persistent actor instance: PASS.
- Survey/route completion without opening the map: PASS. This does not establish that new players understand the landmark puzzle.
- Cave-exit reveal flag: PASS; camera bounds block exterior before the threshold in implementation. Repeat-load/reveal visual polish is not independently human-approved.
- Stand-up blocked under crouch and crawl ceilings: PASS at x3600 / x4100, heights36 /20.
- Standing permitted after constriction at x5200: PASS.
- Checkpoint restoration to safe static floor: PASS.
- Brittle surface explicit FSM reaches SETTLED; settled collision enabled: PASS.
- Flat jump: walk apex44.8269, reach65.2528; run apex44.8254, reach116.0039; both0.4833s airtime.
- Six graphical scene captures generated successfully using OpenGL Compatibility / Intel UHD. Full topology and cave captures visually inspected. This is graphical rendering evidence, not a completed human interactive playtest.

## Found and corrected

- Self-intersecting thick terrain ribbon failed convex decomposition: replaced with native convex segment colliders.
- Crest overhang trapped the beginning of LEFT descent: increased tier clearance.
- Generic grabbable slope tags pulled the actor onto the wrong tier: restricted grabbing to designated lips.
- Cave and descending shelf overlapped: moved cave160 units lower and added an actual left-side drop/return mouth.
- Cave entrance ramp led the actor back up: replaced with a short separate ledge above the cave entry floor.
- Potential low-posture jump from base controller: added a shared jump-permission guard.

## Not verified / acceptance still open

Not a claim that the full handoff acceptance gate is closed. Unscripted human play, 10–12-minute novice pacing, every optional branch, wrong-route recovery, deliberate shortcut prevention, full ledge/shimmy/descent coverage, per-hazard walk/run timing, crash interruption during save, and every cave checkpoint re-entry permutation remain unverified. The opening is a permitted three-second placeholder, not a produced cinematic. Current Survey is spatial blockout; its reasoning/readability needs human evaluation. Main route passed; do not use the test count as proof of quality.

## Scene evidence

Actual engine captures under `atlas-the-lonely-world/tests/nomad_evidence/`:

- `topology.png`: implemented terrain plus developer-only direction annotations.
- `a01.png`, `a02_survey.png`, `a03_left_descent.png`, `cave.png`, `horizon.png`: close-ups from the implemented scene.

Test saves use separate temporary filenames, not the player's Continue save.
