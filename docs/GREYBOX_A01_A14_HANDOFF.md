# Atlas greybox A01–A14

Implemented 2026-11-01 in the existing Godot project. Scope authorized by the Director's request to reach Echoing Ruins. All new geometry, timing and placeholder mechanism staging are implementation proposals, not new story canon.

## Run

Open `atlas-the-lonely-world/project.godot` in Godot 4.7.2 and press F6 on `Scene/campaign/campaign.tscn`, or F5 for the configured main scene. Choose **Perjalanan baru**. Continue restores the current automatic checkpoint. The developer area selector changes the current checkpoint; it is intended for inspecting individual levels, not a second save slot.

Controls: A/D or arrows move, Shift run, Space fixed-height jump; W or Space climbs a grabbed ledge, S releases it. Hold E at mechanisms; E at the outgoing threshold advances after Moss arrives. Q at observation locations widens the camera and records an observation. Tab toggles the witnessed-only journal; Esc pauses. R retries the current checkpoint. No combat, dash, double jump or companion command.

The original mechanics laboratory remains at `Scene/prototype/greybox.tscn`.

## Implemented route

| Region | Areas | Greybox implementation |
|---|---|---|
| R01 Nomad Valley | A01 Settlement, A02 Survey Ridge, A03 Cliff Passage | Descending/ascending terrace profiles, houses/inhabited silhouettes, two branch pockets, observation point, natural marker stand-ins, narrow passage and controllable horizon camera widening |
| R02 Broken Crossing | A04 Crossing Rim, A05 Fallen Span, A06 Shared Bridgeworks, A07 Downstream Descent | Cold fractured silhouettes, visibly cracked reactive shelves, physical lower catch tier, first Moss appearance only in A05, lever → autonomous Moss catch → final support interaction in A05/A06 |
| R03 Overgrown Aqueduct | A08 Terraces, A09 Rooted Sluice, A10 Courtyard, A11 Meadow | Green canopy/water vector placeholders, A09 pressure-diversion feedback and co-op gate, fragile post-gate walkway with lower catch shelf, A10 support/latch/bridge sequence, safe A11 hesitation |
| R04 Echoing Ruins | A12 Galleries, A13 Survey Hall, A14 Ascending Works | Dark monumental column/vault silhouettes, archaeological mineral arcs introduced here, A13 physical-frame indicator and co-op crossing, safe brief Moss hesitation, A14 ending threshold representing the R05 boundary |

Each area is a separately loadable scene backed by reusable geometry/system code and its own elevation profile in `Scene/campaign/areas.json`. Thin bridge/shelf modules use one-way collision; foundations, walls and gates remain solid. The common lower tier is intentionally generous for early validation. Optional upper pockets reconnect with the spine; no optional route can pass through a closed mandatory gate.

## Systems

- Reused Okto sprite assets and controller; fixed jump impulse replaces the prior release-to-cut jump. Existing old smoke-test expectations for short-jump height are therefore superseded.
- Automatic ledge detection and explicit climb/drop, with collision clearance check before climbing.
- Moss is a 30-unit physical CharacterBody2D placeholder with eyes/feet. Collision does not push Okto. Safe-anchor AStar routing, cached waypoints, local replan, obstacle/gap jumps, physical descent through thin platforms, follow/observe/cooperate/wait feedback. No follow-time position warp. Scene entry and checkpoint restore initialize actors at valid spawn locations.
- Mechanism milestone persistence, hold-to-operate progress, physical gate collision, both-actor exit requirements.
- Automatic checkpoint and journal JSON save at `user://atlas_greybox_v1.json`, schema 1, temporary-file rename; menu New Game replaces this development save.
- Short camera-only reveal/Survey beats; no timed hazard steals player input. Transient title/prompts rather than a permanent gameplay HUD.

## Verification and limits

`tests/campaign_smoke.gd` exercises every scene, absent/present companion ordering, closed/open gates, actual player physics traversal through all areas, physical Moss traversal to exits A05–A14, actual hold-input/autonomous co-op sequences A05/A06/A09/A10/A13, fixed jump tap/hold apex, and checkpoint serialization. It backs up/restores the development save. Run with Godot console `--headless --fixed-fps 60 --path <project> --script res://tests/campaign_smoke.gd`. The full final output is `docs/greybox_test_results.txt`.

The graphical runtime also rendered an inspected preview in `atlas-the-lonely-world/tests/echoing_ruins_preview.png`.

This is a compact mechanics greybox, not full production-spec signoff. The 60–90 minute R03/R04 playtime has NOT been measured or met as a production claim. Common traversal modules are reused heavily and need authored pacing/variation. A02 alignment is represented spatially with optional Survey, not a polished concealment puzzle. A05 provides a safe drop/encounter and reciprocal mechanism but its multi-beat rescue choreography is simplified. A09 uses discrete feedback rather than a full hydraulic simulation; A13 alignment is a hold-operated staged mechanism rather than a reversible multi-wheel puzzle. Full prologue/epilogue, animated NPCs/fauna, final audio/art, world-map illustration, accessibility settings and blind novice playtests remain outside this mechanics pass. Scene changes are explicit developer-greybox handoffs, not finished seamless transitions.

Automatic tests do not establish novice readability, emotional pacing or all possible branch/backtracking states. Those need human playtests before final terrain or art production. Sprite sheets are preserved; no upscaling was used to invent texture detail.

## Source handling

Director-provided originals are preserved under `docs/incoming/`, including both extracted ZIPs and the SVG layout. Story foundation and newer visual reveal pacing supersede conflicting older proposals. References to Master Canon v4 / Unified v1.8 in the supplied documents were not available as separate files in this handoff; no missing lore was invented. Referenced documents describe production intent, not proof that their acceptance criteria have already passed.
