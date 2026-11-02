# ATLAS OF THE LONELY WORLD
# R03–R04 GREYBOX PRODUCTION SPECIFICATION — FINAL v1.0

**Date:** 2026-11-01  
**Status:** GAME DIRECTOR TECHNICAL DECISIONS LOCKED; numeric physics and geometry require measured calibration.  
**Scope:** A08–A14 together, transitions A07→A08 and A14→A15, Windows/keyboard first, controller later.  
**Primary authorities:** (1) latest explicit Game Director decisions (43 creative + 35 technical), (2) `ATLAS_OF_THE_LONELY_WORLD_MASTER_CANON_FINAL_v4.0.md`, (3) `ATLAS_R03_R04_FINAL_GAMEPLAY_ENVIRONMENT_BLUEPRINT_v1.0.md`, (4) `ATLAS_GREYBOX_TECHNICAL_BLUEPRINT_A01_A07_v1.0.md` and `ATLAS_OPENING_GAMEPLAY_BLUEPRINT_A01_A07_v1.md` where compatible.

> **Final** means direction, controls, topology contract, state behavior and deliverables are fixed. It does **not** claim that controller physics, pixel scale, precise distances, existing project integration, or gameplay performance have already passed Godot tests. The existing Godot project has not been provided for inspection; script paths and node interfaces below are implementation specifications, not verified descriptions of its current code.

## 1 — Decision lock: all 35 technical answers

### 1.1 Runtime
- Existing Godot project with Okto controller, camera, and some A01–A07 already exists. **Integrate**, do not discard or rewrite blindly.
- Design viewport **1920×1080 (16:9)** with adaptive display scaling. This is a *design resolution*, not a command to draw sprites at 1920 native resolution. Preserve aspect-aware camera limits and check lower-resolution monitors.
- **Keyboard first**; controller support after keyboard functionality is stable. **Windows PC first**.
- Okto feels responsive with natural weight. **Fixed jump height**; running speed affects horizontal range. No variable-height jump; remove any variable-jump behavior from new R03–R04 implementation if present, but first assess its effect on existing A01–A07.
- Valid ledges auto-grab; player explicitly climbs/releases. Camera smooth-follow with look-ahead and vertical camera zones; puzzle mechanisms receive short contextual framing then camera returns.

### 1.2 Level/navigation
- One main scene per A08–A14; reusable subscenes for mechanics, props, and cinematics.
- Two meaningful connected optional loops for large areas; one for transition-scale areas; no mandatory backtracking or shortcut unlocking.
- Optional discoveries: vista, contextual Survey, fragments of lore, Moss/fauna interactions. **No shortcut required after puzzle completion; progression continues forward.**

### 1.3 Puzzle interaction
- One contextual interact action; heavy wheels require **hold-to-operate** with readable in-world progress. Survey optional for solving.
- Hint ladder: physical/visual clue → Moss reaction → short contextual text after a delay; no solution reveal on initial observation.
- Completed main puzzles are persistent and cannot be arbitrarily reset; *unfinished* stages remain safely recoverable.

### 1.4 Moss
- Moss acts on its own when physical conditions are met. **Okto must wait for Moss**; no automatic teleport, offscreen warp or forced catch-up that defeats this choice.
- If Moss is separated or stuck, player returns to fetch Moss; pathing and level design must make this possible without soft-lock.
- Optional contextual companionship interactions near Moss, fauna and landmarks. A13: brief unstable movement, Okto checks Moss, both continue.

### 1.5 Safety/cinematics
- Falls lead to physical recovery shelves where plausible, otherwise the nearest valid automatic checkpoint.
- Auto checkpoints at area entry, before large challenges and after main puzzles.
- Exactly one major dynamic sequence: A09 weakened walkway visibly flexes then collapses; lower recovery route.
- Short in-engine cinematic camera/animation; preserve control where feasible. **No cinematic skip control.** Therefore every control-lock segment must be short, deterministic, idempotent, safe to replay, and never interrupt a timed hazard.

### 1.6 Production
- Greybox uses **blockout plus temporary environment illustrations**, but collision shapes remain explicitly readable. Start with consistent-scale Okto/Moss placeholders; replace only after sprite calibration.
- **Build all A08–A14 as the first playable prototype** (not only A08–A10); A08–A10 remains the first subsystem-integration milestone inside that all-area prototype.
- Handoff: **runnable Godot project + technical blueprint + test checklist**. Validate controller/camera, then each area, then blind playtest.

## 2 — Canon reconciliation and conflict resolution

| Topic | Older guidance | New binding decision | Production resolution |
|---|---|---|---|
| Initial scope | A08–A10 vertical slice first | All A08–A14 together | First release gate is a *complete seven-area playable prototype*. Implement foundational systems A08–A10 first, then finish A11–A14 before calling prototype complete. |
| Optional loops | Connected loops + some shortcut backtracking | No shortcuts after puzzles | Two loops in large areas, one in transitions, **all rejoin ahead or at their junction**; no unlockable backtracking shortcut. A loop is exploration, not an alternate route bypassing a required puzzle. |
| Moss catch-up | Offscreen safe-anchor regroup allowed | Okto waits; player retrieves stuck Moss | **Disable teleport/automatic offscreen regroup in R03–R04.** Companion has physically traversable navigation graph, waiting feedback, player-accessible return path, and last-safe-anchor local recovery only through deliberate player re-approach. Never require Moss to cross impossible geometry. |
| Cinematics | Skippable control-lock cinematics | No skip | No skip input. Hard-limit lock durations and avoid locks during danger; camera-only beats generally retain control. Reload must not corrupt completed events. |
| Jump | Variable jump possible in old technical blueprint | Fixed height, run-based horizontal range | Lock fixed vertical impulse; measure walk-run jump range separately. Keep coyote/buffer as test hypotheses. |
| Prototype visuals | Simple colored shapes first | Blockout with temporary illustrations | Collision silhouette and functional colors remain visible beneath nonfinal illustrated layers. Never use art to obscure hazards or create fake footholds. |
| R04 emotional tone | Mystery/concern | Monumental architectural discovery foremost | Awe remains dominant; Moss Instability is secondary and noncritical. |
| R03/R04 | Region ecology and hydrology | Dramatic visual contrast | Transition uses dry service climb, same Accord material family and geology; water never climbs uphill. |

**Nonnegotiable lore protection:** Game 1 does not disclose Moss=Oru, Vara, the full historical cause of the Fracture, Origin Core solution, or moral verdict on past factions. Moss is autonomous and never a battery, key, or magical energy source. No combat, dash, double jump, wall jump, swimming, or mandatory audio-only clue. Survey is nonmagical observation; Living Map logs only witnessed/traversed areas.

## 3 — Physical calibration contract (before placing final greybox measurements)

**Unit system:** `1 CU = standing Okto collision height`; `Jw = measured comfortable walk-jump horizontal reach`; `Jr = measured comfortable run-jump horizontal reach`. Existing controller is authoritative after instrumentation. Godot +Y is downward; macro-world elevation is conceptual, not literal area coordinate.

| Parameter | Starting target / rule | Verification |
|---|---|---|
| Camera | ~5 CU visible vertically; ~8.89 CU horizontally at 16:9 | Okto 18–22% frame height; gameplay readability at real scale |
| Ground step | ≤0.18 CU initial | Can step without false snagging |
| Grabbable ledge rise | ≤0.65 CU initial | Hands/feet and climb clearance verified |
| Standard gap | 0.55–0.75 × measured relevant `Jw` or `Jr` | No max-range mandatory jumps |
| Hard gap | 0.80–0.90 × measured relevant reach | Only after readable setup and recovery |
| Coyote time | 0.10 s provisional | Feels responsive, no double-jump loophole |
| Jump buffer | 0.12 s provisional | Works on landing, no phantom repeat |
| Air steering | Test ~35–55% of ground steering | Player can correct landing without arcade float |
| Jump height | **Fixed** | Tap vs hold produces same apex, regardless of button duration |
| Horizontal jump | Speed-sensitive | Run jump travels farther than walk jump without changing apex |
| Walkway warning | ~1.2–1.8 s provisional | Visual warning + generous recovery, never surprise failure |
| Puzzle read platform | ~2–4 CU when spatially possible | Mechanism visible before irreversible commitment |

**Required measurement fixture:** a separate `CalibrationRoom.tscn` in the project containing 1-CU ruler, walk/run runway, ground gaps measured in `Jw/Jr`, ledge grab test, vertical camera test, collision silhouettes, Moss-follow path, shallow water and hazard recovery. Log actual measured values in `calibration_results.md`; do not fabricate pixel dimensions or jump speed from these normalized targets. Character visuals use one master baseline, consistent feet pivot, collision body and fixed scale for idle/walk/run/jump/climb; test at game camera zoom, not illustration zoom.

**Keyboard action names (suggested mappings; reuse existing InputMap if already standardized):** `move_left` A/Left, `move_right` D/Right, `jump` Space, `interact` E, `climb` W/Up, `drop` S/Down, `survey` Q or existing action, `map` Tab or existing action, `pause` Esc. Do not silently overwrite existing key bindings. `interact` handles all mechanism operations and optional Moss interaction. No companion-command action and no cinematic-skip action.

## 4 — Cross-region topology and time budget

```
A07 Downstream Descent [water from R02]
  ↓ T02: canal feeder, falling elevation, growing canopy
A08 Aqueduct Terraces — discovery / two loops
  ↓
A09 Rooted Sluice — hydraulic four-stage puzzle / two loops / dynamic walkway
  ↓
A10 Twin-Made Courtyard — reciprocal co-op / two loops
  ↓
A11 Wild Channel Meadow — ecological respite / two loops
  ↑ T03: leave water, dry service stairs, progressively enclosed space
A12 Sheltered Galleries — monumental discovery / one transition-scale loop
  ↓
A13 Resonant Survey Hall — structural puzzle + localized resonance / two loops
  ↑
A14 Ascending Works — combined traversal / one transition-scale loop
  ↑ T04: wind, exterior rock and R05 Fracture Windfield
A15 Fracture Windfield [handoff only, outside scope]
```

**Hydrology:** R02 water enters R03 feeder at +310–440 m regional band, diverts locally into lower outlets and drains away southeast; Okto climbs dry architecture toward R04 +450–600 m. There is no reverse/uphill water flow. R03 is dense, living, sunlit, and wet; R04 is drier, dimmer, monumental, with dramatic light shafts and recognizable shared Accord construction.

**Time budget (first-time player):** A08 8–10, A09 12–15, A10 9–12, A11 6–8, A12 7–9, A13 11–15, A14 7–10 minutes; combined **60–79 min nominal**, leaving up to 90 min for cautious exploration. Do not enforce timers or pad empty corridors. Pacing alternates effort and relief. Loops add optional discovery without forcing repetition.

## 5 — Module graph and implementation per area

Notation: `M` mandatory module, `L` optional loop, `CP` checkpoint, `SV` Survey, `LM` Living Map observation, `TR` trigger. Each area has a main path and a *return-safe* Moss route. Loop connectors must not create unreturnable one-way falls. Dimensions below are expressed in CU/J relationships, not unverified meters.

### A08 — Aqueduct Terraces (R03, discovery)
**Scene:** `res://areas/r03/A08_AqueductTerraces.tscn`. **Target:** 8–10 min; two loops.
1. `M08_01 Feeder Reveal`: stable 3–4 CU arrival shelf, CP entry, first panorama; camera shows upstream intake and lower outlet. `LM_A08_FEEDER`; Moss investigates water.
2. `M08_02 Terrace Traverse`: two gentle rise/fall ledge modules, 0.55–0.70 `Jw` gaps, shallow water slowing movement but not requiring swim; nonfatal lower return shelf.
3. `J08`: clear upper/lower junction. `L08_UPPER` canopy-root bridge with `SV_A08_CHANNELS` vista; `L08_LOWER` wet shelf with fauna reaction and alternative observation. Both rejoin `X08` ahead of junction.
4. `M08_03 Canal Spine`: root foothold and channel rim, no gate puzzle here. Show A09 gate silhouette early.
5. `M08_04 Sluice Approach`: safe staging platform and exit checkpoint. Trigger `A08_COMPLETE` only when Okto **and Moss** reach marked safe exit anchor.
**Environment:** 3 depth layers plus illustrated overlays; thick canopy but clean foreground collision outlines, bright noon sunlight, moving water strictly in background where not interactive.
**Failure:** falling from upper route lands on lower shelf and rejoins without backtracking shortcut.

### A09 — Rooted Sluice (R03, hydraulic centerpiece)
**Scene:** `res://areas/r03/A09_RootedSluice.tscn`. **Target:** 12–15 min; two loops around central puzzle (upper inspection gallery, lower drainage walk); all rejoin control platform.
1. `M09_01 Read`: entry CP, stable observation deck frames feeder→blocked gate→overflow→lower drain→exit. Optional `SV_A09_HYDRAULICS` shows relationships, never button order.
2. `P09_1 Load Release`: Okto reaches overflow shutter and **holds interact** until open. Water visually diverts *downhill*, pressure drops, persistent `A09_OVERFLOW_OPEN` and `A09_PRESSURE_RELIEVED`.
3. `P09_2 Moss Access`: exposed narrow dry culvert becomes accessible; Okto braces its entry physically. Moss voluntarily approaches, enters, releases lightweight root-bound catch. Player can see/track Moss through silhouette windows; culvert never floods. Persistent `A09_MOSS_CATCH_RELEASED`.
4. `P09_3 Main Wheel`: Okto holds interact on main handwheel, counterweight lifts gate; opening cannot occur until pressure and catch conditions are true. Persistent `A09_GATE_OPEN`.
5. `P09_4 Joint Crossing`: both traverse freed passage; walkway starts flexing with dust/cracks and clear visual warning, then collapses into safe lower catch shelf. If either character is still in an unsafe spot, authored guard defers collapse until recovery is guaranteed; no forced Moss path into collapsing plank. This is the **only major dynamic set piece** in A08–A14.
6. `M09_EXIT`: safe reunion and post-puzzle CP; no unlockable shortcut back to entrance.
**State FSM:** `ENTRY → READABLE → OVERFLOW_OPEN → PRESSURE_RELIEVED → MOSS_ACCESSIBLE → CATCH_RELEASED → GATE_OPEN → CROSSING_STARTED → BOTH_SAFE`. `READABLE` can be reached without Survey. Save milestone stages after pressure relief, catch release, and gate opening. Invalid state transitions are rejected; unfinished hold action can safely cancel. Completed gate/water diversion never reset on retry.
**Hydraulic model:** directed graph `FEEDER → MAIN_GATE` and `FEEDER → OVERFLOW → LOWER_DRAIN`; flow level changes discrete/animated, no real-time fluid simulation. Gate collision toggles only on explicit animation/state marker.
**Companion fail-safes:** Moss cannot enter culvert until water and door interlocks safe. If Moss stalls, Okto can return to entrance, re-approach and wait. Every culvert segment has reachable player observation point and deterministic local AI retry; no teleport. If path impossible, QA failure: repair geometry/anchors before ship.

### A10 — Twin-Made Courtyard (R03, reciprocal cooperation)
**Scene:** `res://areas/r03/A10_TwinMadeCourtyard.tscn`. **Target:** 9–12 min; two loops, upper inscription terrace and lower maintenance alcove.
1. `M10_01 Reveal`: paired-scale architecture visible on first arrival; LM observation and CP.
2. `P10_1 Okto Raises Support`: heavy physical lever, hold interact; opens Moss-size lateral access while Okto has a safe upper route.
3. `P10_2 Moss Acts`: Moss independently moves through accessible lower corridor, releases far latch; player watches through open architectural gaps.
4. `P10_3 Okto Locks Bridge`: physical counterweight and handwheel, fixed-height traversal to stable platform; bridge locks permanently.
5. `P10_4 Reunion`: Okto waits on safe platform for Moss to physically cross; a short mutual gesture plays after both reach anchor; CP and onward exit.
**FSM:** `COURT_REVEALED → SUPPORT_RAISED → MOSS_PASSAGE_OPEN → LATCH_RELEASED → BRIDGE_LOCKED → BOTH_REJOINED`. Avoid duplicating A09 hydraulics; this is **spatial reciprocity**. All routes have reversible access while puzzle incomplete. Never place Okto on a one-way high ledge while Moss is still behind a nonreturnable gate.

### A11 — Wild Channel Meadow (R03, respite)
**Scene:** `res://areas/r03/A11_WildChannelMeadow.tscn`. **Target:** 6–8 min; two ecology loops.
1. `M11_01 Meadow Arrival`: bright clearing, stable ground, fauna reaction, Moss curiosity.
2. `L11_UPPER`: root arch and canopy overlook, easy ledge chain; `L11_LOWER`: shallow streambank and fauna alcove; rejoin central clearing.
3. `M11_02 Companion Beat`: contextual Moss interaction; first very subtle hesitation/uneven movement, no explanation. Trigger once and persist `MOSS_INSTABILITY_A11_SEEN`.
4. `M11_03 Dry Service Stair`: the stream turns away and descends; player starts rising on dry inspection stairs. Exit CP and T03.
**Gameplay:** light traversal only, no major mechanism or timed challenge. Fauna never enemy/combat.

### A12 — Sheltered Galleries (R04, reveal)
**Scene:** `res://areas/r04/A12_ShelteredGalleries.tscn`. **Target:** 7–9 min; one connected gallery loop (transition-scale), plus mandatory spine.
1. `M12_01 Dry Stair`: wet stains fade, roots thin, same stone join and metal fittings continue.
2. `M12_02 Monumental Entry`: wide stable platform, camera reveals vast vaulted service hall; `LM_A12_ENTRY`, short cinematic pan while movement remains available if safe.
3. `L12_GALLERY`: upper vantage → lower workshop fragment → rejoin at hoist shaft; `SV_A12_STRUCTURE` optional. Loop includes visual symbol/lore fragment but no full historical exposition.
4. `M12_03 Hoist Shaft`: two ledge grabs and one controlled descent; ordinary gaps 0.55–0.75 measured J, recovery shelf. Pre-shaft CP.
**Audio:** optional echoes only; matching visible dust, architectural marks and motion always communicate essential information.

### A13 — Resonant Survey Hall (R04, structural puzzle)
**Scene:** `res://areas/r04/A13_ResonantSurveyHall.tscn`. **Target:** 11–15 min; two loops (upper inspection ring, lower dry maintenance trench) returning to the hall.
1. `M13_01 Read`: entry CP, visible physical linkage between three structural frames and a far crossing. Optional `SV_A13_FRAMES` provides perspective/geometry.
2. `P13_1 Counterweight`: Okto releases first physical frame using accessible mechanical control; frame rotates to a known discrete angle.
3. `P13_2 Moss Latch`: Moss independently uses a narrow dry service route and releases secondary lock. Okto remains able to return to Moss's starting anchor; no teleport.
4. `P13_3 Alignment`: Okto adjusts remaining frame positions through hold-to-operate wheel. Wrong alignment yields visible mismatch and reversible mechanism states, never full reset.
5. `P13_4 Resonance Feedback`: only when physical frames align, small localized indicator responds briefly; mechanical bridge settles into place. **Resonance does not power bridge or use Moss as energy source.** Persist `A13_FRAMES_ALIGNED`, `A13_CROSSING_OPEN`.
6. `M13_02 Moss Episode`: once both safely land beyond bridge, Moss stumbles briefly. Okto approaches/checks; short in-engine authored beat, no skip button, no hazard during lock; both proceed. Persist `MOSS_INSTABILITY_A13_SEEN` and `A13_EMOTIONAL_BEAT_DONE`; CP.
**FSM:** `HALL_ENTERED → FRAME_RELEASED → MOSS_LATCH_RELEASED → FRAMES_ALIGNED → CROSSING_OPEN → BOTH_SAFE → MOSS_EPISODE_DONE`. Observation/Survey flag independent of progression. Echo clues optional with visible counterparts.

### A14 — Ascending Works (R04, climax of traversal)
**Scene:** `res://areas/r04/A14_AscendingWorks.tscn`. **Target:** 7–10 min; one connected route loop (exposed upper hoist / sheltered lower service) rejoining before final ascent.
1. `M14_01 Switchbacks`: vertical/horizontal alternating traversal; stable rest shelves and camera zone changes; CP entry.
2. `J14/L14`: exposed upper hoist path and protected lower service path; both require moderate combinations of known movement, rejoin before `M14_02`. Neither is a permanent shortcut.
3. `M14_02 Combined Challenge`: fixed jump + ledge grab + controlled descent + marked fragile support, slightly above R02 difficulty but never max-reach. Pre-combo CP, lower catch route.
4. `M14_03 Wind Breach`: safe vista, wind cues grow, architecture opens to geology. `LM_A14_RIDGE`, Moss physically reaches exit anchor, CP, T04→A15.
**Emotional tone:** concern is present but Moss remains capable; no critical collapse or identity reveal.

## 6 — Moss no-teleport navigation contract

**FSM:** `FOLLOW → INVESTIGATE → WAIT_SAFE → PATH_TO_PLAYER → COOP_READY → COOP_ACT → RETURN_TO_PLAYER → FOLLOW`; additional `BLOCKED_WAIT` and `LOCAL_RETRY` states; `INSTABILITY_BRIEF` only in authored safe beats. **No `RECOVER_OFFSCREEN` transition in R03–R04.**

**Mandatory companion design rules:**
1. Every mandatory Okto jump/ledge/gate has a physically possible Moss route (not necessarily same path). Bake a per-area `MossNavigationGraph` of safe anchors, traversal edges, and door-state guards; test both directions on all unfinished-puzzle branches.
2. Moss has a visible wait/attention signal if it cannot continue. Okto may walk back to Moss; a blocked edge is never one-way until both characters have crossed or a return route exists.
3. If player reaches exit without Moss, transition remains closed **in-world** (Okto notices/turns back) rather than an invisible hard wall. Do not lock camera or force teleport.
4. On pathfinding failure, Moss stops at its last reachable physical anchor; re-approach by Okto triggers local route recomputation. If path is still impossible, log test failure and repair navigation before release; **never rely on a hidden teleport fallback**.
5. When Okto uses a safe drop and Moss cannot follow directly, build a visible adjacent Moss path with accessible player return. No moving platform may permanently depart with one actor stranded.
6. On reload, restore Moss at a **physically valid saved anchor** corresponding to persistent gate/bridge state; never spawn inside a closed door or beyond an unresolved puzzle.
7. Wait time is authored, not punitive: keep path lengths short, avoid excessive Moss speed penalties, and make movement/intent readable. Test that waiting adds relationship texture without stalling the 60–90 minute target.

## 7 — Camera and cinematic implementation

- `CameraDirector`: smooth follow with horizontal velocity look-ahead (~0.6–1.2 CU starting range), vertical soft zones, area bounds, and authored puzzle framing points. Respect actual tested Okto camera scale.
- `CameraZone2D`: optional `focus_anchor`, `blend_time`, `bounds`, `allow_player_control`, `return_policy`. Never cut to mechanism during a jump whose landing is not visible.
- Cinematic events: A08 vista, A09 diversion, A10 mutual success, A11 companionship, A12 monumental reveal, A13 resonance and Moss check, A14 ridge reveal. Most are camera gestures with input active. If temporary input lock is unavoidable, use **brief** authored beats (~1–3 s starting target) only when both actors stand safe; no skip required or offered.
- `CinematicDirector` guards `played_flag` and can resume/load safely: on reload apply end-state, do not strand characters in animation. During A09 collapsing walkway, never start a control-lock cinematic.
- Keep map contextual, no persistent HUD; hold-interact uses an unobtrusive localized progress affordance. Mechanism and traversal cues must work without audio.

## 8 — Scene architecture and scripts (Godot 4.x)

```text
res://
  autoload/
    GameState.gd                  # persistent flags, chapter, instability
    SaveManager.gd                # atomic save/load, schema version
    AreaRouter.gd                 # gated area transitions, both actors present
    MapJournal.gd                 # witnessed-only map and Survey records
  characters/
    Okto.tscn / OktoController.gd # reuse existing; adapt only as necessary
    Moss.tscn / MossCompanion.gd   # physical companion, no teleport
    MossNavigationGraph.gd
  shared/
    CalibrationRoom.tscn
    CameraDirector.gd / CameraZone2D.gd
    Checkpoint2D.gd / CheckpointManager.gd
    ContextInteractable.gd / HoldInteractable.gd
    ReactivePlatform.gd / RecoveryVolume.gd
    SurveyNode.gd / ObservationZone.gd
    AreaExitGate.gd / AreaDefinition.gd
    CinematicDirector.gd / NarrativeTrigger.gd
    MechanismBase.gd / PersistentMechanism.gd
    WaterFlowController.gd / WaterVolume.gd
    HintDirector.gd / FaunaReaction.gd
  areas/r03/
    A08_AqueductTerraces.tscn
    A09_RootedSluice.tscn
    A10_TwinMadeCourtyard.tscn
    A11_WildChannelMeadow.tscn
  areas/r04/
    A12_ShelteredGalleries.tscn
    A13_ResonantSurveyHall.tscn
    A14_AscendingWorks.tscn
  puzzles/
    A09_SluicePuzzle.gd
    A10_CourtyardPuzzle.gd
    A13_ResonantHallPuzzle.gd
  tests/
    TestSaveReload.gd / TestMossReachability.gd
    TestPuzzleTransitions.gd / TestAreaExits.gd
  docs/
    calibration_results.md / QA_CHECKLIST.md / IMPLEMENTATION_LOG.md
```

**Scene tree per area:**
```text
Area_Axx (Node2D, AreaDefinition)
 ├─ SpawnPoints (OktoStart, MossStart, RecoveryAnchors)
 ├─ TerrainStatic (TileMapLayer/StaticBody2D)
 ├─ TerrainReactive (ReactivePlatform instances)
 ├─ Mechanisms (reusable packed scenes)
 ├─ Water (A08–A11; visual flow graph + hazard volumes)
 ├─ Navigation (MossNavigationGraph + physically valid anchors)
 ├─ Branches (main spine, upper loop, lower loop)
 ├─ Checkpoints / RecoveryVolumes
 ├─ SurveyNodes / ObservationZones / LoreFragments
 ├─ CameraZones / CinematicAnchors
 ├─ NarrativeTriggers / HintZones / Fauna
 ├─ TemporaryArt (noncollision overlays, parallax)
 └─ ExitGate (requires both Okto and Moss + area completion)
```

**Script responsibility contracts:**
- `OktoController.gd`: stable physics/collision and animation baseline; fixed jump impulse, speed-dependent horizontal range; ledge grab only on valid collision layers. Emit `landed`, `grabbed_ledge`, `interact_started`, `interact_cancelled` signals.
- `ContextInteractable.gd`: nearest eligible target, short contextual prompt, no multiple ambiguous interactions; `HoldInteractable.gd` updates normalized progress, cancels safely if player leaves range.
- `MossCompanion.gd`: anchor navigation, observation and initiative, `waiting_for_okto`/`arrived_at_anchor`/`coop_action_done` signals; never call global reposition to follow Okto.
- `AreaRouter.gd`: entry/exit validation; do not instantiate a new Moss/Okto each scene without preserving state; either use persistent actor nodes or a documented state transfer. Both actors must be in exit safe zone.
- `WaterFlowController.gd`: directed water edges and discrete routing; visuals/collision derived from puzzle flags; no costly continuous fluid solver.
- `PuzzleController`: explicit FSM with guards and idempotent `apply_state()`, signal-driven animations, persisted milestone keys, no direct hard-coded global scene lookups.
- `SaveManager.gd`: schema version, atomic write/replace, area ID, checkpoint ID, actor anchor positions, puzzle stage, water flow, opened bridges, seen cinematics, map observations, instability stage. Validate restore order: instantiate scene → apply persistent mechanisms/water/collision → resolve valid actor spawn anchors → enable AI/input → camera settle.
- `CheckpointManager.gd`: only activate on safe static ground; checkpoint never references an already collapsed plank or flooded volume.
- `HintDirector.gd`: per-puzzle inactivity clock reset by meaningful progress; visual affordance first, Moss reaction second, short text third; no hints during cinematic/active timed sequence.

**Implementation note:** Do not overwrite the user's current Godot project structure blindly. On receiving the actual project, first inventory InputMap, scene ownership, collision layers, autoload names, scripts, camera and asset import settings; adapt the suggested architecture to existing code without duplicating managers.

## 9 — Checkpoint, save, retry and soft-lock audit

| Area | Checkpoints (design IDs) | Persistent critical state | Recovery requirement |
|---|---|---|---|
| A08 | `CP_A08_ENTRY`, `CP_A08_EXIT` | map/survey observation | Lower wet shelf returns to spine |
| A09 | `CP_A09_ENTRY`, `CP_A09_PRESSURE`, `CP_A09_GATE`, `CP_A09_EXIT` | diversion, latch, gate, crossing completion | Safe lower walkway landing; no culvert flooding |
| A10 | `CP_A10_ENTRY`, `CP_A10_BRIDGE`, `CP_A10_EXIT` | support, Moss latch, bridge | Both actor paths reversible until bridge locked |
| A11 | `CP_A11_ENTRY`, `CP_A11_EXIT` | first instability beat | Streambank returns to dry stair |
| A12 | `CP_A12_ENTRY`, `CP_A12_SHAFT`, `CP_A12_EXIT` | observed fragments | Hoist lower shelf and reachable climb |
| A13 | `CP_A13_ENTRY`, `CP_A13_ALIGNED`, `CP_A13_EXIT` | frame alignment, bridge, Moss beat | Wrong frames reversible; Moss route never locked |
| A14 | `CP_A14_ENTRY`, `CP_A14_PRE_COMBO`, `CP_A14_EXIT` | route completion, ridge observation | Catch shelf or immediate safe checkpoint |

**Cross-area checkpoint invariant:** A07→A08 and A14→A15 are handoffs; never erase existing A01–A07 flags. Area completion requires both characters, except authored historical A01–A04 where Moss is absent. On death/reload, every essential mechanism and companion path is coherent. If player has to return for Moss, return route is traversable without resetting a completed puzzle.

**State schema example (illustrative, not code to paste directly):**
```json
{
  "schema_version": 1,
  "area_id": "A09",
  "checkpoint_id": "CP_A09_PRESSURE",
  "okto_spawn_anchor": "A09_CENTER_SAFE",
  "moss_spawn_anchor": "A09_CULVERT_ENTRANCE_SAFE",
  "puzzles": {"A09": "PRESSURE_RELIEVED"},
  "persistent_flags": ["A09_OVERFLOW_OPEN", "A09_PRESSURE_RELIEVED"],
  "map_observations": ["A08_FEEDER"],
  "moss_instability_stage": 0
}
```

## 10 — Environment blockout art contract

**R03:** bright midday, strong natural contrast, extremely dense overgrowth; visible feeder, spillway, canal, roots and stone terraces. Temporary painterly images can establish color and atmosphere but may **not** substitute for collision geometry or make foreground platforms indistinguishable. Water flows visibly downward; shallow wading and dangerous currents have different shape/motion cues. Fauna reacts to presence but cannot block mandatory route.

**R04:** dramatic tonal shift to dim vaulted spaces, monumental Accord masonry, utilitarian maintenance mechanisms, selective shafts of daylight, restrained localized Resonance feedback. Shared cut-stone joints, metal brace language and erosion connect the regions. No random fantasy runes, generic temple props or supernatural spectacle that explains the lore.

**Layer separation:** foreground decoration (nonblocking), gameplay collision plane (high-contrast), midground mechanics and water, background monuments/landmarks, distant atmospheric parallax. Camera zoom must preserve ledge outlines, handwheel prompts and Moss visibility. Temporary illustrations tagged `TEMP_ART`; every interactive surface has explicit collision and debug overlay option. Do not ship final sprite sheets until consistent feet pivot/scale/animation readability verified.

## 11 — Production execution order: complete seven-area first prototype

**Gate G0 — Existing-project audit and calibration:** inspect project structure; duplicate/branch safely; confirm Godot version; measure Okto walk/run speed, fixed jump apex, `Jw/Jr`, ledge grab, camera zoom, input and sprite scale; test Moss following on sample geometry. Output `calibration_results.md`.

**Gate G1 — Shared foundations:** implement/checkpoint/save, area router, Moss graph, contextual interaction/hold progress, camera zones, Survey, recovery, visual hint ladder, temporary art debug overlay. Unit tests for state reload and both-actor exit.

**Gate G2 — R03 full spine:** build A08→A09→A10→A11 end-to-end, all loops, four-stage sluice, co-op courtyard, meadow, temporary illustrations, companion navigation, checkpoint and persistence. A08–A10 is internal system-integration checkpoint, **not** the finished prototype scope.

**Gate G3 — R04 full spine:** build A12→A13→A14 end-to-end, monumental reveal, frame/Resonance puzzle, Moss instability beat, ascent and R05 handoff; all loops and checkpoints.

**Gate G4 — Cross-region integration:** run complete A07→A08→…→A14→A15 handoff, verify geography, water, camera, narrative triggers, state restoration, Moss physically following, timing 60–90 min, no soft-lock. This is the first **complete runnable prototype**.

**Gate G5 — Blind playtest and corrections:** record confusion, failures, waiting time for Moss, puzzle completion time, loop discovery, hint usage, cinematic interruptions, frame time and asset readability. Correct collision/camera/route before final art.

**Gate G6 — Art production authorization:** only after all mandatory tests pass; create environment art kits and calibrated sprites. No need to reopen locked creative direction.

## 12 — Acceptance tests: mandatory release checklist

### Controller and camera
- [ ] Godot Windows build opens and runs A08–A14 without missing scripts/assets.
- [ ] 1920×1080 design viewport scales cleanly to 1600×900, 1366×768 and other common 16:9 sizes; non-16:9 handled without cropped required hazards.
- [ ] Okto fixed jump apex is identical on short and long button presses; running changes reach, not jump height.
- [ ] Idle/walk/run/jump/climb placeholders and later sprites have consistent collision height, feet pivot and displayed scale; no blur at tested camera.
- [ ] Auto ledge grab only occurs on eligible lips; climb/drop works and never strands player in collision.
- [ ] Camera tracks smoothly and puzzle framing returns to Okto without hiding an active hazard.

### Topology and geography
- [ ] A07→A08 follows descending water; A11→A12 climbs away from water; A14→A15 reaches windy ridge.
- [ ] Each large area has two meaningful connected loops; A12 and A14 have one each; no required backtracking shortcuts or bypassed essential beat.
- [ ] All seven areas have safe approach/read, obstacle, landing/recovery and breathing-room modules.
- [ ] R03 visually lush/bright, R04 monumental/dim, shared material logic clear; all mandatory paths readable.

### Puzzle and companion
- [ ] A09 diversion has a visible lower destination; 4 stages work without Survey; water never rises uphill or floods Moss's culvert.
- [ ] A09 weakened walkway always telegraphs failure and has reachable lower recovery; only one major dynamic sequence.
- [ ] A10 puzzle demonstrates two-way physical cooperation and permanent bridge state.
- [ ] A13 frames align physically; Resonance is a localized indicator, not a power source; echo clue is optional.
- [ ] Moss autonomously acts when appropriate; **never teleports**; Okto can physically return to retrieve Moss on every reachable state.
- [ ] No door, bridge, drop, moving platform, checkpoint, or reload can trap Moss or Okto on opposite sides without a return path.
- [ ] If Moss cannot path, it visibly waits and recomputes on Okto's return; game cannot falsely mark both present.
- [ ] A11 Instability subtle; A13 episode noticeable but noncritical; no prohibited lore reveal.

### State, UI, cinematics, quality
- [ ] Every major completed mechanism persists after death, area change and reload; incomplete stages can be resumed or safely reset locally.
- [ ] Every checkpoint restores coherent collision, water, mechanism and Moss anchor before player input resumes.
- [ ] Visual → Moss → delayed text hint order works; no mandatory audio-only information.
- [ ] No skip input exists; every brief control-lock beat is safe, idempotent and never overlaps active timed hazards.
- [ ] No combat, dash, double jump, wall jump, mandatory swimming or persistent HUD introduced.
- [ ] First-time blind-playthroughs average within target 60–90 min without padding or repeated soft-lock recovery.
- [ ] Test log includes deaths/falls, route confusion, puzzle stalls, Moss waiting duration, hints, Survey, camera trouble, FPS and save/reload regressions.

## 13 — Deliverable definition and status

**Required final handoff package:**
1. `Atlas_R03_R04_Greybox_Godot/` — runnable Godot 4 project integrated with existing project, containing A08–A14, shared systems, input map and temporary art, with Windows launch instructions.
2. `ATLAS_R03_R04_GREYBOX_PRODUCTION_SPEC_FINAL_v1.0.md` — this locked specification.
3. `QA_CHECKLIST.md` + `calibration_results.md` + `IMPLEMENTATION_LOG.md` — tested results, measured controller values and known issues.
4. Optional Windows export after project boots and export templates are available.

**Current honest status:** specification completed; **runnable Godot project has NOT been built or tested**, because the existing Godot project and controller scenes/scripts have not been supplied in this turn. The project source is a required implementation input, not a request to reopen decisions. The first execution step is an audit of the existing Godot project followed by G0–G5.

## 14 — Trilogy continuity guard

**Game 1:** R03 celebrates living infrastructure and reciprocity; R04 reveals monumental traces and a limited Moss concern, not the truth of his origin. R05–R06 progression unchanged.

**Game 2:** preserve uncertainty around Moss's identity, Vara, historical Accord and Resonance; clues remain interpretable after later revelations without requiring retcon.

**Game 3:** mechanisms are physical infrastructure with ecological and social consequences, not instant magical restoration; choices and stakes remain available for later narrative payoff.

**Final production rule:** no repeated design questionnaire. Resolve implementation uncertainty by inspecting the existing project, measuring the controller, and recording test outcomes; do not change locked creative decisions without an explicit newer Game Director instruction.
