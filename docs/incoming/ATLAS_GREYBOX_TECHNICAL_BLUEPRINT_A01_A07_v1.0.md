# ATLAS OF THE LONELY WORLD — GREYBOX TECHNICAL BLUEPRINT A01–A07
**Version:** 1.0 · **Date:** 2026-11-01 · **Status:** Game Director design decisions locked; numerical values provisional pending Godot playtest.

## 0. Authority and reconciliation
Authority: Master Canon Final v4.0 > Game Director's latest 60 greybox decisions and 45 opening decisions > Opening Gameplay Blueprint A01–A07 v1.0 for compatible details. This document is an implementation specification, not a new lore source. Scope: New Game through R02→R03 boundary. Preserve 6 regions/12 chapters/20 areas, A05 first encounter, no combat, no dash/double jump, no Moss in A01–A04, two-way agency, 2D side-on, semi-linear exploration, no HUD except map and contextual prompts.

**Resolved interpretations:** (1) A02 map is *not* an active puzzle UI: ancient map's incomplete symbol establishes context in opening, but Survey plus in-world stone alignment is sufficient to find exit. Do not require reopening map. (2) Runtuhan warning is **visual-only as a required clue**; crack/impact/material audio remains as ambient feedback, not mandatory advance warning. (3) Village remains inhabited despite sparse activity; quiet departure does not imply nobody notices. (4) Geometry is near-final in *proportions/topology*, not final artwork. (5) 'Subtle' visual warnings must remain discernible at real camera scale; avoid untelegraphed fatal failures. (6) Cinematics are frequent only at major emotional beats and never interrupt a timed rescue. (7) Extra user note 'b' has no interpretable design instruction; no new requirement inferred.

## 1. Coordinate system and measurement convention
All numbers below are **prototype hypotheses**, not canon. Design using normalized character units (CU): 1 CU = Okto standing collision height, irrespective of sprite pixel resolution. World +X east/progression, +Y downward in Godot. Each area has its own origin; do not read coordinates as continent kilometers. Camera viewport target shows Okto at 18–22% of vertical frame, thus ~4.5–5.6 CU vertically; start at 5 CU. Visible width follows tested aspect ratio (16:9 gives ~8.9 CU at 5 CU height). Collision body height = 1 CU; feet pivot is reference y. Distinguish artwork silhouette from collision body. Grounded comfortable horizontal jump range J is measured from the real controller (not assumed). Place ordinary gaps at 0.55–0.75 J, hard gaps at 0.80–0.90 J, never at 1.0 J for mandatory first-time jumps. Step-up ≤0.18 CU; ledge climb ≤0.65 CU subject to tests; lower-route fall heights must use landing safety tests, not arbitrary CU.

### Prototype controller targets
- Horizontal movement: quick response, slight acceleration/deceleration; test acceleration to full run in 0.12–0.22 s and deceleration in 0.10–0.20 s.
- Jump: weighty takeoff, relatively short apex, reduced mid-air horizontal authority; test air steering at ~35–55% ground steering, while preserving correction for fair landing. Variable jump height optional only if it does not undermine the heavy feel.
- Initial coyote time 0.10 s; jump buffer 0.12 s; both subject to first-time-player tests.
- Auto ledge grab only on safe, marked-by-geometry graspable lips, when falling and hands are clear. Do not grab crumbling hazards after they enter Falling state. Controlled descent at grabbable edges; no wall jump.
- Landing input must not lock out immediate movement/jump. Keep animation and collision scale fixed across all states.

## 2. Geometry contract and topology
Each traversal module should have approach/read space → commitment point → consequence → landing/recovery → breathing room. A level uses 2–4 CU horizontal readable approach where practical, then one meaningful obstacle, rather than chains of tiny jumps. Paths are upper/lower tiers connected by ledges and short descents. Optional branches always return to the spine and cannot bypass essential story triggers. Route legibility comes from silhouettes, negative space, illumination, water flow, and architecture; no floating objective arrows.

### A01 — Nomad Settlement: house → quiet terrace → ridge foot
**Playable start:** Okto at house doorway immediately after cinematic; no mandatory indoor collection. Layout modules: (01) safe horizontal residential lane (move/run), (02) low stone step and gentle slope (jump), (03) climbable terrace lip (auto ledge grab/climb), (04) narrow optional viewpoint recess, (05) stepped outer terrace with second optional recess, (06) rock path into A02. Two optional recesses rejoin within one short screen each. No fatal falls. At least three visible inhabited details across depth layers, without making a busy market. Context prompts only at first relevant action. Checkpoint at ridge transition.

### A02 — Survey Ridge: terrace ascent → lookout → concealed gap
Modules: (01) rising stable shelves with 0.55–0.70 J gaps; (02) training brittle shelf over recoverable lower landing; (03) stable climb to observation node; (04) Survey viewpoint showing three formations (Split Crown, Tilted Needle, Cut-Stone Witness — **temporary production identifiers**, not lore names); (05) two plausible route candidates, one short dead-end with alternate viewpoint; (06) concealed gap behind rock silhouette, reachable by normal traversal. **Puzzle logic:** Survey camera frames two aligned formations and a third confirmation stone; player follows their in-world spatial alignment to find gap. Map is never required to solve. Wrong branch returns within ~30–50 s, test target. Hidden exit is visually obscured from village, not invisibly triggered. Checkpoint before exposed climb; no view of outside before A03.

### A03 — Cliff Passage: narrow → vertical → dark → open
Modules: (01) narrow exterior ledge with safe approach; (02) short overhang with ledge grab; (03) controlled descent into a shadowed geological shaft with remnant Accord masonry; (04) single weathered masonry failure over recovery shelf; (05) 1–2 screen tight passage with narrowing ambience; (06) outward threshold. Horizon camera widens as Okto exits; player gets control promptly and may stop. Place an exit-side stable standing platform before next hazard; no forced run. Checkpoint before difficult descent and near reveal if needed.

### A04 — Crossing Rim: solo spine + upper/lower loops
Modules: (01) wide first vista with major broken bridge landmark; (02) split to upper lookout loop and lower sheltered-ruins loop; (03) reconvergence at damaged support; (04) mandatory broken bridge traversal with graspable lips and intermediate safe landing; (05) structural slab that can fall and create a lower route; (06) funnel toward A05 unstable shelf. Upper loop offers sightline/sketch; lower loop offers ecology/material story; neither grants mandatory upgrade. Optional loops each ~1–2 traversal modules, reconnect visibly. Major slab failure must not trap player above or below. Checkpoint before bridge challenge and after it.

### A05 — Fallen Span: forced safe drop → reciprocal escape
**Critical:** Fall is an authored story transition, not a player failure. Enter from A04 on old shelf. Warning is visible, collapse moves Okto into a protected landing volume in lower service chamber; all legal player positions at trigger must land safely. Use camera guidance, never steal input mid-required jump. Chamber has two elevations: Okto-accessible upper brace and Moss-accessible narrow lateral duct. Backtrack route is blocked visibly. Moss approaches cautiously, startling Okto. Puzzle stages:
1. **Discover:** Okto explores lower chamber and sees a jammed brace and narrow opening too small for him. Moss observes from separate safe alcove.
2. **Okto contribution:** traverse a ledge to pull/release a physical retaining lever, lifting a small grate and opening Moss-only passage. Lever is not an arbitrary magic button; show linkage to gate.
3. **Moss contribution:** Moss voluntarily enters, nudges a small catch/counterweight on far side, allowing an anchored climb support to extend for Okto. If Moss hesitates, use look/gesture cues; never require command spam.
4. **Mutual rescue:** weakened exit catwalk starts failing. Okto secures a reachable support and creates a stepping opportunity for Moss; Moss shifts/holds a lightweight brace so Okto can complete exit. Script deterministic beats with generous hold windows; no instant fatal fall.
5. **Exit:** both arrive at A06 side, Moss not instantly bonded. Checkpoints at safe drop and post-stage 3. If puzzle partially completed on death, restore consistent mechanism state (never soft-lock).

### A06 — Shared Bridgeworks: tentative following
Modules: (01) safe regroup stretch; (02) bridge split with Okto-scale upper ledge and Moss-scale narrow bypass; (03) Okto opens access physically; Moss signals interest and moves latch, reconnecting path; (04) more demanding mixed ledge/bridge traversal; (05) optional shared viewpoint. Moss uses dynamic distance and may pause to inspect, but always catches up before mandatory triggers. Keep companion from causing unprompted dangerous collapses on player path. Checkpoint after joint bridge action and before advanced traversal.

### A07 — Downstream Descent: water-guided exit
Modules: (01) old service stair switchback; (02) layered ledges with visible recoverable lower tier; (03) wet wood walkway flexes and can fail, revealing lower path; (04) safe sheltered descent along water; (05) reveal platform looking toward Aqueduct. Water visibly flows downward; Okto follows downstream, with no upstream illusion. Final cinematic shows distant Aqueduct briefly, then restores movement toward R03 boundary. No major R03 water-control puzzle yet. Checkpoint before wet walkway and at R03 transition.

## 3. Reactive props: timing and behavior
All times are initial **playtest ranges**; measure from first player contact to collision loss, and calibrate against actual jump takeoff + reaction. No randomized collapse timers for mandatory traversal.

| Prop type | Visible pre-contact cue | Contact-to-warning | Warning-to-fail | After failure | Failure path |
|---|---|---:|---:|---|---|
| A02 brittle shelf (tutorial) | hairline crack, slight offset | 0–0.10 s | 1.0–1.5 s | resets on checkpoint if needed | safe lower ledge |
| A03 aged masonry lip | tiny grit, unstable seam | 0–0.10 s | 0.75–1.2 s | local reset | recoverable lower shelf |
| A04 large slab | displaced joints, suspended debris | 0–0.15 s | 1.2–1.8 s | persists as alternate path | upper/lower reconnection |
| A05 story shelf | structural fracture visible on approach | 0–0.15 s | scripted 0.8–1.3 s | permanent during scene | protected chamber landing |
| A05 rescue catwalk | visible sag, crack propagation | event trigger | 1.4–2.2 s staged | stage-completion persists | safe catch/retry |
| A07 wet wood walkway | warped boards, flex | 0–0.15 s | 0.8–1.4 s | local reset or lower-route persistence | safe lower tier |

**Visual-only advance warning:** micro-tilt, crack spread, dust, small debris; keep sufficient contrast at target zoom. Audio still plays footsteps, cracking during break, impacts and debris but is not required to recognize impending collapse. Each hazard follows `STABLE → CONTACT_REACT → WARNING → FAILING → SETTLED` with optional `RESETTING`. Warning timer keeps running after Okto jumps away unless prop is specifically designated reusable. Scripted moments use positional guards to prevent unfair collapse if player is not in recoverable zone. Falling collision switches only at explicit FAILING marker, never on animation start by accident.

## 4. State machines
### Okto movement FSM
`GROUNDED_IDLE ↔ WALK ↔ RUN → TAKEOFF → ASCEND → APEX → FALL → LAND → GROUNDED`; `FALL → LEDGE_GRAB → SHIMMY / CLIMB_UP / CONTROLLED_DESCENT → GROUNDED or FALL`; `GROUNDED → SURVEY_INTERACT → GROUNDED`; `ANY_SAFE → CINEMATIC_LOCK → GROUNDED`. Land must allow buffered jump; camera and collision use fixed master pivot.

### Moss companion FSM (unavailable until A05)
`INDEPENDENT_PRESENT → CURIOUS_APPROACH → STARTLED/WARY → OBSERVE → COOP_OPPORTUNITY → COOP_ACT → REASSESS → HESITANT_FOLLOW → INVESTIGATE / WAIT_SAFE / REGROUP → FOLLOW`; `RECOVER_OFFSCREEN` only if unreachable and off-camera, never during witnessed story rescue. Context cues and safe navigation anchors drive initiative. A05 encounter cannot complete if either character's required contribution is skipped.

### Puzzle A02 FSM
`UNOBSERVED → SURVEY_AVAILABLE → SURVEY_VIEWED → ROUTE_RECOGNIZED (optional internal flag) → GAP_REACHED → COMPLETE`. Player may reach gap without toggling recognition if they inferred it correctly; Survey is contextual and helpful, not magic or a mandatory 'unlock hidden passage' button. If mandatory observation interaction is needed for tutorial, require inspection only, never map opening.

### Puzzle A05 FSM
`DROP_COMPLETE → FIRST_SIGHT → BRACE_AVAILABLE → OKTO_LEVER_RELEASED → MOSS_DUCT_TRAVERSED → MOSS_CATCH_MOVED → EXIT_CLIMB_READY → RESCUE_STARTED → BOTH_SAFE → FOLLOW_ENABLED`. Guard transitions with validated actor positions. On reload restore either pre-puzzle or coherent post-stage-3 state. No separate manual Moss command button required.

### Puzzle A06 FSM
`BRIDGE_BLOCKED → OKTO_PATH_OPEN → MOSS_NOTICES → MOSS_LATCH_SHIFTED → BRIDGE_SAFE → BOTH_REJOINED`. Companion AI must have a deterministic fallback after hint delay, not telepathic action through walls.

## 5. Checkpoint / save / recovery
- Checkpoints: `CP_A01_EXIT`, `CP_A02_PRE_EXPOSED`, `CP_A03_PRE_DESCENT`, `CP_A03_POST_REVEAL`, `CP_A04_PRE_BRIDGE`, `CP_A04_POST_BRIDGE`, `CP_A05_DROP_SAFE`, `CP_A05_POST_COOP`, `CP_A06_POST_BRIDGE`, `CP_A06_PRE_ADVANCED`, `CP_A07_PRE_WET`, `CP_R03_ENTRY`.
- Checkpoint saves: Okto transform and facing; current area/scene; puzzle state; major persisted rubble routes; observed landmarks/map entries; Moss state and safe anchor; cinematic flags. Do not respawn into a destroyed platform or inside debris.
- Recoverable falls use a reachable lower route, ideally returning to the spine within ~20–60 s (playtest target). Fatal falls fade/respawn quickly, target <2 s once death is recognized. No inventory or collectible penalties.
- A05 authored fall never calls death or reset; Moss must remain in a reachable valid state after any retry. Optional loops never become inaccessible due to a random prop failure.

## 6. Camera, UI, cinematics
- Camera follows Okto with smoothed horizontal look-ahead (test 0.6–1.2 CU), slight vertical dead zone, and hard bounds preventing outside-level reveals. In risky jumps show landing area in time; never zoom in so much that ledge becomes unreadable.
- Cinematic zones: menu-to-opening establishing; A01 handoff; A02 Survey framing; A03 Horizon Reveal; A05 first sight and mutual rescue reaction; A07 Aqueduct reveal. These are short authored camera beats, not continuous control theft. During timed collapse camera prioritizes gameplay and does not lock controls.
- HUD absent during regular movement. Contextual action prompt near valid Survey/lever/ledge; map opens manually and records actual traversal and observation. A02 map is optional for solving. Delayed hints: initial subtle world cue → short non-spoiler text after stalled interval (test ~45–75 s) → stronger contextual hint only after further inactivity or repeated failure. No quest-arrow GPS.
- Audio: menu piano/ambience; village quiet but inhabited; ridge wind; passage muffled/dark; reveal silence-to-swell; crossing stone/water; Moss gestures and footsteps. Hazard pre-failure visual-only; material impacts remain audible. Offer reduced shake and readable text settings.

## 7. Godot 4 scene architecture (suggested)
```text
GameRoot (Node)
 ├── SaveState (autoload)
 ├── GameDirector (autoload; chapter/beat flags)
 ├── SceneRouter (autoload; transitions)
 └── Area_A0X (Node2D)
     ├── TerrainStatic (TileMapLayer / StaticBody2D)
     ├── TerrainReactive (Node2D; ReactivePlatform instances)
     ├── TraversalAnchors (Marker2D, Area2D ledge zones)
     ├── CameraBounds / CameraZones (Area2D)
     ├── Checkpoints (Area2D)
     ├── SurveyNodes (Area2D)
     ├── PuzzleController (Node; area-specific FSM)
     ├── NarrativeTriggers (Area2D)
     ├── MossNavigationAnchors (Node2D; A05 onward)
     ├── Okto (CharacterBody2D + AnimationTree + collision)
     └── Moss (CharacterBody2D / bespoke controller; A05 onward)
```
`ReactivePlatform.gd`: exported `warning_duration`, `settle_behavior`, `fall_route_id`, `persistence_key`, `required_safe_landing`; signals `contacted`, `warning_started`, `collision_removed`, `settled`. `PuzzleController_A05.gd` owns stages, validates physical lever/catch states, and emits `both_safe`. `CameraDirector.gd` blends authored camera zones with player follow. `MapJournal.gd` logs only visited segments and seen landmark IDs. Use data resources for area graph and hazard tuning rather than hardcoding per-level logic.

## 8. Prototype acceptance tests
1. At actual Godot viewport Okto reads at 18–22% frame height; all animation states use identical scale, foot baseline and collision.
2. New player can move/jump/climb A01 without fatal risk or tutorial wall; settlement still reads as inhabited.
3. A02 hidden exit is found through terrain/Survey, **without opening map**; third rock confirms, does not automatically solve.
4. At least 80% of novice testers notice a visual warning before first dangerous collapse (initial threshold to refine), including muted audio tests.
5. All mandatory jumps are feasible with heavy-jump controller; no pixel-perfect edge placement or mandatory maximum-range jumps.
6. Each lower route can return to spine without permanent trap; checkpoint respawn never creates a soft-lock.
7. A03 reveal shows no exterior panorama before the threshold, returns agency promptly, and permits lingering.
8. A04 upper/lower optional loops reconnect; player experiences meaningful solo traversal before A05.
9. A05 first encounter happens after safe drop; both characters perform observable causal actions; no Moss battery/magic key.
10. Moss AI can follow/regroup across A06–A07 without repeated commands or visible teleport; retries preserve puzzle coherence.
11. A07 water direction and elevation are visually consistent; ending vista introduces R03 but not its full puzzle mechanics.
12. Log time to first success, deaths/falls, hint usage, missed cues, route confusion, camera occlusion, companion stalls; iterate before final art.

## 9. Build order and handoff
**Sprint 0:** viewport/camera and unified Okto placeholder; measure actual J and ledge reach. **Sprint 1:** near-final-proportion A01–A03 blockout, observation puzzle, recovery routes, reveal. **Sprint 2:** A04 loops and reusable reactive platform FSM. **Sprint 3:** A05 staged reciprocal puzzle and companion state machine. **Sprint 4:** A06–A07 shared traversal, map logs, checkpoints, scene transitions. **Sprint 5:** blind playtests, geometry/timing revisions, cinematic polish. Asset finalization only after controller, readability, recovery, puzzle and pacing pass.

## 10. Decision status
**Locked creative direction:** 60 latest Game Director choices + 45 prior opening choices, where compatible with Master Canon v4.0. **Provisional engineering:** CU scale, movement timing, jump fraction, collapse windows, hint timers, checkpoint positions, puzzle physical geometry, camera offsets, and acceptance thresholds. Changes to provisional values are tuning, not lore retcons. Any change to major beats, Moss origin, map origin, or trilogies requires explicit Game Director amendment.
