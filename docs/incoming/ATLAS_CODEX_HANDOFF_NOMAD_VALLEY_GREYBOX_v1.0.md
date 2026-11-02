# CODEX HANDOFF — ATLAS NOMAD VALLEY PLAYABLE GREYBOX
Version 1.0 · 2026-11-02 · Scope: New Game / A01–A03 / threshold of A04 only

## MISSION
Work **inside the existing Atlas Godot project**. Implement a cohesive, playable, side-on 2D greybox of the Game Director's latest Nomad Valley route. The deliverable is not a diagram, decorative mockup, or seven disconnected test rooms. It is one continuous, navigable journey with measured geometry, traversal, Survey, responsive environmental hazards, a progressively claustrophobic cave, and First Horizon Reveal at the threshold of Broken Crossing. Do not build Moss encounter or A04–A07 in this task.

## REFERENCE PRIORITY
1. **Latest spoken Game Director direction (2026-11-02):** house → move RIGHT and ASCEND through settlement and rocks → higher cliff and light observation puzzle → climb to HIGHER summit → descend while moving LEFT through stepped terrain → enter low cave → progress RIGHT through narrowing cave, crouch and crawl → exit into Broken Crossing with horizon reveal. This precise physical turn-back is the primary new design requirement.
2. `ATLAS_OF_THE_LONELY_WORLD_MASTER_CANON_FINAL_v4.0.md` — lore, opening sequence, region boundary, movement, Survey, 10–12-minute playable Nomad Valley target.
3. `ATLAS_OPENING_GAMEPLAY_BLUEPRINT_A01_A07_v1.md` — prior gameplay beats.
4. `ATLAS_GREYBOX_TECHNICAL_BLUEPRINT_A01_A07_v1.0.md` — mechanics, units, hazard, camera, checkpoint baseline, except where latest direction changes topology.
5. `a_wide_detailed_infographic_game_level_design_map.png` — **visual reference for greybox readability, elevation, modular presentation and atmosphere, not literal collision geometry or navigation topology**. Its broad rightward descent is superseded by the Game Director's explicitly specified leftward switchback.

If any reference is unavailable in workspace, identify missing inputs and continue with the grounded instructions here; do not invent canon details. Never assert you tested a Godot version unless you actually used it. Target Godot 4.7.2 as requested; report actual installed version.

## NON-NEGOTIABLE ROUTE TOPOLOGY
World side-on, X increases right, Godot Y increases down. Preserve spatial continuity rather than teleporting to reverse travel. The path has three major phases:

**A01 / FIRST ASCENT:** house door (START) → RIGHT on quiet village terraces → RIGHT and UP on stepped stone, farm edges, low ledges → RIGHT and UP into natural rock. Camera can look back across valley; outside world cannot be seen.

**A02 / HIGH ASCENT:** continue RIGHT and UP along short-medium climbing modules → observation terrace with three recognizable stone formations → one readable in-world Survey puzzle (no map UI needed) → RIGHT and UP to a higher summit/crest. One brittle-rock teaching hazard has a safe recovery ledge. View remains enclosed by Nomad Valley's mountain ring.

**A03 / LEFTWARD DESCENT + CAVE:** from summit, route folds back LEFT and DOWN on a separate lower elevation tier, not by undoing the entire ascent. Design a believable switchback: visually separated upper and lower paths with cliff wall and overhangs, controlled descents, ledge grabs and one recoverable masonry collapse. Player must understand that moving LEFT is correct through framing and geology, not a UI arrow. Reach cave entrance on left/down side. Within cave, passage turns and proceeds RIGHT: standing height → crouch height → crawl-only constriction → brighter opening. End at safe exit ledge overlooking R02 Broken Crossing; First Horizon Reveal occurs here, not at summit or earlier. Restore player control quickly. Do not introduce Moss.

ASCII TOPOLOGY (conceptual only, NOT scaled):

                         [A02 SURVEY] ---> [HIGH CREST]
                       /                          \
  [HOUSE] -> [VILLAGE] -> [ROCK ASCENT]             v
                        upper RIGHT ascent       [DESCENT ledges]
                                                  <--- <--- <---
                                        [CAVE MOUTH]
                                             \
                                              --> [STAND] -> [CROUCH] -> [CRAWL] -> [LIGHT / HORIZON] -> [A04 ENTRY]

The descent can be layered beneath the climb in world coordinates, but collision and camera must prevent the player from accidentally bypassing the intended puzzle or dropping through floors. Do not confuse the game camera's horizontal leftward movement with a change in continental west-to-east macro geography: the switchback is a local path fold within the eastbound mountain crossing.

## GREYBOX MEASUREMENT CONTRACT
- Calibrate existing Okto first. `1 CU = Okto's standing collision height`; feet/pivot and sprite scale remain consistent across idle, walk, run, jump, climb, crouch, crawl.
- On gameplay camera Okto should occupy approximately 18–22% of viewport height; derive camera zoom from actual sprite/collision dimensions, not hardcoded assumption.
- Measure actual ground speed, acceleration, air control, jump apex, horizontal reach J, ledge reach, controlled descent and safe landing height in a calibration scene.
- Okto should feel responsive but weighty; limited midair correction. Test initial coyote time ~0.10s, jump buffer ~0.12s; no double jump, dash or wall jump.
- Ordinary gaps: ~0.55–0.75 of measured J; harder mandatory gaps: <=0.90 J, only after player learns mechanic. All numerical dimensions are **prototype baselines**, not approved final physics.
- Each module: approach/read space → obstacle → response/consequence → safe landing/recovery → breathing room. Avoid repetitive rows of identical platforms and empty horizontal corridors.
- Use polygonal near-final terrain silhouettes and clean collision shapes, not randomly scattered rectangles; keep visuals untextured greybox with distinguishable solid, brittle, ledge, cave and camera trigger layers.

## AREA MODULES / PLAYER BEATS
**A01: approximately 3–4 minutes of playable target**
1. Control at house door after short opening cinematic or a safe placeholder sequence if existing cinematic is not implemented. No mandatory interior item collection.
2. Quiet village lane: walk/run, sparse but clear inhabited background silhouettes; no fatal hazards.
3. First low steps, small jump, short staircase and raised farm terrace.
4. First ledge grab/climb on natural lip; clear landing area.
5. One optional small viewpoint/recess returning to main route; view back over settlement.
6. Village terraces give way to increasingly natural mountain path. Checkpoint at transition.

**A02: approximately 3–4 minutes of playable target**
1. RIGHT+UP ascent over medium-length shelves, occasional safe gaps, varied height rhythm.
2. One brittle rock that visibly shifts, cracks and drops AFTER the player has had a fair chance to jump; lower recovery path rejoins route, no mandatory fatality.
3. Reach Survey terrace with three readable landmark formations. Use contextual Survey interaction that reframes existing visible geometry and makes relationships legible; do NOT magically highlight solution or require Living Map opening.
4. Puzzle: two formations suggest orientation, third confirms alignment with a real accessible geological passage. Wrong approach yields a short understandable return loop, not a long dead end.
5. After solving by reading the environment, climb to a higher ridge/crest. No outside panorama yet. Checkpoint before exposed climb.

**A03: approximately 3–4 minutes of playable target**
1. At summit, terrain curves down into a LEFTWARD switchback. Camera reveals the left-descending shelf ahead, with background valley behind; ensure player understands where to go.
2. Traverse successive ledges left/down, including automatic ledge grab and controlled descent. Vary spacing and provide recovery ledges.
3. One ancient masonry failure with subtle but visible dust/micro-tilt and safe lower recovery.
4. Cave mouth at lower left, clearly readable as next destination, framed by rock wall and remnants of old construction.
5. Inside cave, path turns RIGHT. Start at >1 CU headroom for standing, then intermediate crouch-only passage, then crawl-only squeeze; dimension these against actual character collision states with tolerance. Implement crouch/crawl collision and transitions without clipping, stuck states or sprite-scale tricks.
6. Claustrophobia through ceiling proximity, reduced light/visible depth, camera framing, constrained locomotion and subtle ambience. No unavoidable fatal hazard in crawl-only section.
7. Bright slit ahead widens; at threshold, camera opens onto large Broken Crossing gorge and ancient broken bridge. Short Horizon Reveal, then return control to Okto on a safe, stable platform. Place R02 entry trigger and checkpoint. Stop scope here; A04 gameplay begins in later milestone.

## PHYSICAL REACTIVE HAZARD SPEC
Use reusable hazard scene/controller, explicit states `STABLE -> CONTACT_REACT -> WARNING -> FAILING -> SETTLED`, optional reset for local nonpersistent hazards. Contact timers keep running after Okto leaves unless configured otherwise. Visual warning is mandatory (small motion, cracks, debris); sound may support but is not sole cue. Start with A02 brittle shelf warning-to-failure 1.0–1.5s and A03 masonry 0.75–1.2s, tune against measured takeoff and player reaction. Disable collision at explicit failure state. Each hazard has a lower recovery route. Do not generate random lethal failures. Persist only structural changes important to route state.

## SURVEY PUZZLE SPEC
States `UNOBSERVED -> SURVEY_AVAILABLE -> SURVEY_VIEWED -> ROUTE_FOUND -> COMPLETE` with route detection based on physical player location; Survey cannot conjure a door. A player who spots the route without Survey may still traverse it; optional tutorial Survey interaction can be encouraged through composition. Provide a short, nonintrusive contextual prompt at the landmark and a short text hint only after meaningful hesitation. Three rock formations should be distinct silhouettes visible from the actual camera zoom. Living Map records visited/observed facts, not unseen map contents.

## CAMERA AND AUDIO
- Smooth side-on Camera2D, horizontal look-ahead in movement direction, vertical dead zone, hard level bounds, camera regions per ascent/crest/descent/cave/reveal.
- During leftward descent, look-ahead must switch LEFT; never stubbornly frame to the right.
- Do not show Broken Crossing before the cave exit. Cave camera narrows readable space but does not hide imminent collision or make controls feel broken.
- Horizon Reveal: smooth wider framing, restrained camera takeover, no forced movement into danger, prompt return of control.
- No persistent HUD; prompts only when contextually necessary. Audio: footsteps/material, environmental ambience, rock impacts, cave acoustics, reveal music if existing audio available; do not fabricate finished assets.

## CHECKPOINT / SAVE / SOFT-LOCK
At minimum checkpoints after A01, before A02 exposed ascent, before A03 descent, and after A03 reveal. On failure: recoverable lower path where geographically plausible, otherwise fast respawn at safe checkpoint. Save observed landmarks, Survey progress, important hazard state, reveal flag, player safe position. Never respawn in destroyed collision or inside a crawl ceiling. Validate moving both directions, crouch-to-stand clearance and exiting/reentering cave.

## GODOT EXISTING PROJECT RULES
1. Inspect `project.godot`, Git status, engine version, main scene, input actions, Okto controller, camera, animation, scene routing, save/autoload, collisions. Record baseline. Do not create a replacement project.
2. Make safe working branch/commit or backup as permitted, never overwrite unrelated uncommitted work.
3. Reuse existing nodes/scripts where sound; isolate modular scenes for each area, shared hazard, Survey and camera zones. Use typed GDScript and Godot 4-compatible APIs.
4. Create missing crouch/crawl input and animation placeholder ONLY if needed; maintain Okto fixed scale/pivot.
5. Implement A01 first, then A02, then A03, with a continuous playable route from New Game. The latest Game Director route overrides any old A03 layout that goes continuously right.
6. Build a simple **developer debug overlay only** (toggleable and OFF by default) for CU, camera bounds, checkpoint, player state, Survey state, hazard state, current area and collision outlines. Do not show this in normal gameplay.

## VALIDATION / EVIDENCE
- Run actual Godot executable; report version and exact commands. Import, parse and runtime logs must be clean of blocking errors.
- Verify A01->A02->A03->R02 threshold in one uninterrupted playthrough; check directional sequence RIGHT+UP / LEFT+DOWN / RIGHT+CAVE.
- Test each traversal gap with measured J and at target camera zoom, not only editor zoom.
- Test A02 puzzle success without opening map, wrong-route recovery, and shortcut prevention.
- Test hazard timing under walk/run/jump, and lower-path recovery.
- Test crouch/crawl entry/exit, stand-up headroom check, reload in cave, and collision against narrow ceilings.
- Test Horizon Reveal fires once, never exposes outside world early, and returns control.
- If automated or graphical playtesting is unavailable, clearly mark what was NOT verified. Do not say 'perfect' or 'fully tested' without evidence.
- Supply screenshots of full level geometry with elevation and direction arrows, plus close-ups of A01, A02 puzzle, A03 descent, cave and reveal; screenshots must come from implemented scene, not just concept image.

## DELIVERABLES
- Modified **existing** Atlas Godot project with playable A01–A03 and R02 threshold.
- Greybox scenes, hazard module, Survey module, cave crawl/crouch implementation, camera zones and checkpoint integration.
- `docs/NOMAD_VALLEY_GREYBOX_IMPLEMENTATION.md` explaining actual module dimensions, coordinates, jump reach, hazard timing, puzzle states and deviations.
- `docs/NOMAD_VALLEY_GREYBOX_QA.md` listing tests actually run, results, blockers, and human-playtest questions.
- A single full-level topology image exported from the real editor/scene, clearly showing RIGHT ascent, LEFT descent, RIGHT cave and region boundary.
- Concise final summary with exact run instructions and remaining tuning parameters.

## ACCEPTANCE GATE
Do not claim completion unless: (a) existing project launches; (b) the player can travel continuously from house to Broken Crossing threshold; (c) ascent-right / descent-left / cave-right is implemented physically, not implied by cutscene; (d) movement and camera are consistent; (e) Survey has readable in-world logic; (f) hazards respond and recover fairly; (g) crouch/crawl truly fit geometry; (h) Horizon Reveal is at cave exit; (i) no Moss in this scope; (j) no blocking soft-lock or runtime error observed in tests.

**START:** Audit the existing project now, implement and test. Do not stop after writing a plan. If a critical blocker prevents progress, report it precisely and preserve project integrity.
