# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Godot Integration Specification

### Baseline and unknowns
User reports Godot **4.7.2** and Okto sprite/collision **128 px**. Verify version via installed editor and `project.godot`, inspect `CharacterBody2D` collision shape height, sprite source dimensions, `Camera2D.zoom`, viewport stretch and texture import settings. Do not assume 128 px is collision height or that every frame has 128 px canvas. Use existing controller; no replacement without an identified compatibility issue.

### Suggested scene tree (adapt to existing project)
```text
R01_NomadValley (Node2D)
  WorldState (Node)
  LevelRoot (Node2D)
    A01_NomadSettlement (Node2D)
      BG_Sky (Parallax2D or project-equivalent)
      BG_Far (Parallax2D or project-equivalent)
      BG_Mid (Parallax2D or project-equivalent)
      GameplayTerrain (Node2D / TileMapLayer groups)
      PropsInteractive (Node2D)
      PropsAmbient (Node2D)
      FG (CanvasGroup/Node2D)
      Triggers (Node2D)
      Checkpoints (Node2D)
    A02_SurveyRidge (Node2D)
    A03_CliffPassage (Node2D)
  Okto (existing CharacterBody2D scene instance)
  CameraRig (existing Camera2D / scripted limits)
  WorldAudio (Node)
  UIContext (CanvasLayer)
```
Exact node classes depend on existing Godot 4.x project and verified API; do not replace established `TileMapLayer`/parallax conventions without inspection.

### Calibration protocol (must run before asset export sign-off)
1. Record Okto sprite master canvas size, visible bounding box, feet anchor, collision shape and transform scale for idle/walk/run/jump. All actions must have identical **collision geometry** and stable world-space feet.
2. Measure collision height `H_collision_px` in world units. Define `1 CU = H_collision_px`. If reported 128 px is the collision height, provisional 5 CU camera height = 640 world px; otherwise recompute. Never treat 640 as final until measured.
3. Set 16:9 target; check actual visible world rectangle under current Camera2D zoom and viewport stretch. Record Okto screen-height fraction; test target 18–22% without assuming zoom formula.
4. Measure controller comfortable jump J, maximum jump, ledge grab envelope, landing recovery and run acceleration using debug markers. Place initial gaps from measured J, not fixed pixel assumptions.
5. Import test stone, timber, cloth, grass at 1× camera and downscaled 1280×720; compare nearest vs linear filtering appropriate to painterly art, inspect edge halos and mipmaps. Verify texture compression/alpha settings.
6. Test 5 parallax groups with 16:9 camera; no visual slip across tile seams, no overdraw spikes or obscured interactables.
7. Test A03 camera reveal: never expose R02 vista early, prevent camera clipping outside painted layers, maintain control and safe landing.
8. Capture performance baseline on target PC; choose texture tile size, batching and effect budgets from measurements.

### Input and scene behavior
Keyboard/gamepad bindings should use existing InputMap actions. Preserve controller jump, run, ledge grab, descent; no dash/double jump. Survey is contextual at node; no magical scan UI. Context prompts fade after use. A01 optional pockets never bypass main checkpoint; A02 Survey logs once; A03 horizon/map event fires once upon actual observation.

### Collision / camera / persistence
Use physics layers for world solid, one-way platform, interaction, hazard, character; actual bit indices determined by existing project. Falling shelves require pre-contact visible weakness and reaction, then recoverable lower landing. Keep no fatal fall A01. Camera zones: A01 relaxed; A02 overlook framing preserves three markers; A03 tight passage → wide horizon. Save states must preserve discovered map observations and avoid duplicate triggers.

### Source asset acceptance
No blurry Okto, no idle/run scale jump, no visible halo at alpha edges, no terrain seam, no invisible collision edge, no blocked platform due to foreground, no scene crash or invalid path. Require screenshot/video at 1920×1080 and 1280×720, both showing same relative readability.
