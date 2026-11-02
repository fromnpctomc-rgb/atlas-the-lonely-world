# Prototype rebuild — route and acceptance contract

Director decisions recorded 2026-11-01. This document supersedes the earlier implementation handoff's acceptance claims. Existing A01–A14 implementation remains a rejected mechanics experiment, not an accepted level-design baseline.

## Locked decisions from the Director

- Scope remains A01–A14, ending at the R04/R05 boundary. English is the base language for menus, prompts, journal and hints.
- Relaxed-to-medium difficulty with variation, readable consequences and forgiving recovery.
- Natural, relatively low fixed-height jumps. Reach higher lips through hands/ledge grab and climb; do not raise the jump impulse to compensate for bad geometry.
- Ordinary terrain must work for Moss without the player rescuing malfunctioning AI. Returning to Moss is reserved for deliberate emotional/story beats. Navigation failure is a development defect.
- Preserve the supplied Okto assets for scale. Moss/environment may use readable placeholders until mechanics are accepted.
- All areas must be completable in sequence; puzzles need visible clues, causal rules and understandable solutions; checkpoint/load and companion navigation must not soft-lock.
- Ordinary area boundaries are automatic connected-world transitions, without an E prompt. Explicit story events may use separate staging when justified.
- Routes must have clear purpose and distinguishable main/alternate paths, supporting regional story and geography.

## Engineering and calibration proposals — not yet measured

1 CU is the existing 54-unit standing collision height. Start calibration around 0.7–0.9 CU jump apex, rather than the existing ~2 CU apex. Candidate speeds are walk 135, run 240, impulse 360, upward gravity 1550 and downward gravity 1850 world units; ground acceleration targets remain 0.12–0.22 seconds and braking 0.10–0.20 seconds. These values are hypotheses, not validated settings.

Measure actual walk/run reach before placing mandatory gaps. Comfortable gaps use 55–70% of measured reach. A raised landing must be checked with its actual elevation, not the flat-ground range. Hands may catch a clearly defined lip above the ballistic foot apex, with reachable hand placement and free body clearance. Climb is a short collision-safe motion through a validated path, not an instantaneous position jump. Ledge release has a regrab cooldown; no grabbing arbitrary undersides or crumbling surfaces after failure.

Camera starts near 5–5.5 CU visible height and anticipates landings. Vertical framing changes with terrain zones, not every footstep or jump. Camera-only vista beats retain control. Survey is bounded and cancels/restores safely; overlapping tweens must not fight. Camera boundaries must not expose the next panorama early or visibly halt at a normal area seam.

## Connected-world implementation contract

Keep persistent Okto, Moss, camera and journey state outside individual area scenes. Areas contain authored collision, terrain modules, navigation, mechanisms and triggers, visible/editable in Godot. Stream the next area before the player reaches a connector; unload distant areas only after both actors clear it. Neighbour entry/exit elevations and corridor silhouettes match. Do not reinstantiate or reset actors at ordinary seams. Return traversal remains possible until an explicitly authored story event closes it.

Checkpoints are explicit stable platforms before/after challenges, not every N pixels. Save includes both actor safe anchors, mechanism milestones, journal and story flags. Runtime scene connections, save compatibility and backwards traversal must be checked together. Use a new save schema for the rebuilt world instead of interpreting old experimental coordinates as new safe anchors.

## Route grammar

Main path: continuous terrain/material language, broad safe approach, visible landing and regional destination landmark. Alternate path: a readable junction, a distinct discovery, and visible reunion. Recovery path: reachable consequence of a missed jump, clearly returning to the main route. Never use a continuous bottom floor that bypasses the main puzzle. Optional routes cannot bypass story triggers or mandatory mechanisms.

Each mandatory module contains reading space → commitment → consequence → landing/recovery → rest. Alternate traversal, observation, cooperation and respite; do not make every screen a jump or a lever. Length comes from connected spaces with purpose, not scaling up the same corridor. Screen counts below are initial composition budgets, not measured playtime or canon geography.

## Authored area routes

| Area | Main route in order | Alternate route and reunion | Required readable purpose / rhythm | Initial screen budget |
|---|---|---|---|---|
| A01 Nomad Settlement | Upper doorway → descending home lane → communal terrace → small bridge → rising ridge foot | Tree-side upper line and lower working-yard pocket; both return before the ridge ascent | Establish home through inhabited silhouettes, cloth and tended plots. Walk, one low jump, one hand-assisted climb. No fatal fall. | 8–10 |
| A02 Survey Ridge | Shelf ascent → brittle tutorial shelf → stable lookout → aligned natural formations → concealed fracture mouth | Short false ridge with alternate view, returning to lookout; no invisible unlock | Observation supplies spatial evidence: player identifies the gap through alignment, not by opening a magic door. Safe recovery below brittle shelf. | 8–10 |
| A03 Cliff Passage | Exposed lip → graspable overhang → controlled descent → shadow cleft → stable outer threshold | A short protected ledge rejoins before the final compression corridor | Compress → darken → release into the fractured crossing. Landing and camera reveal occur on stable ground, followed by room to linger. | 6–8 |
| A04 Crossing Rim | Vista shelf → fork → damaged support reunion → broken bridge segments → unstable approach to A05 | Upper lookout and sheltered lower ruin route reconnect at the support; both retain return access | Meaningful solo traversal. Bridge destination is visible before commitment; recoverable descent teaches reading structure. No Moss imagery. | 10–12 |
| A05 Fallen Span | Visibly failing shelf → protected lower chamber → upper retaining brace → Moss duct → shared escape support → reunion shelf | Small inspection recess reveals the brace linkage; cannot bypass encounter | Three observable causal beats: Okto frees Moss's passage; Moss releases an exit support; Okto provides the final safe stepping opportunity. Story fall is never a death/reset. | 8–10 |
| A06 Shared Bridgeworks | Regroup ledge → paired-scale fork → access brace → Moss latch → shared bridge → mixed crossing → quiet shared vista | Upper observation ledge loops back before the brace; lower companion route remains visible | Establish tentative companionship with a new spatial problem, not a repeat of A05's rescue. Both actors physically reach the bridge before its departure/closure. | 9–11 |
| A07 Downstream Descent | Service stairs → layered descent → warped timber → protected water-side return → feeder overlook → R03 connector | Sheltered lower route recovers a failed timber crossing and reconnects downstream | Downward water and gradual return of vegetation establish geography. Respite after tension; no water-control puzzle here. | 7–9 |
| A08 Aqueduct Terraces | Feeder arrival → shallow terrace traverse → root/canal junction → canal spine → sluice approach | Canopy-root overlook and stream/fauna shelf reconnect before the sluice staging area | Renewed light, water and ecology. Observe upstream/downstream relationships before controlling them in A09. | 10–12 |
| A09 Rooted Sluice | Read feeder/gate/drain → divert overflow → expose safe Moss culvert → release catch → operate main wheel → weakened crossing → reunion | Upper inspection gallery and lower drainage walk rejoin the control deck without bypassing the gate | Hydraulic state changes have visible downstream consequences. Wheel cannot open under load; Moss route stays dry. Post-gate collapse has readable warning and reachable recovery. | 12–15 |
| A10 Twin-Made Courtyard | Paired-scale entry → raise support → Moss lower passage → far latch → counterweight platform → lock bridge → reunion | Upper material/marking terrace and lower maintenance alcove return before bridge control | Spatial reciprocity: Okto changes Moss's access; Moss changes Okto's access. Different physical layout and reasoning from sluice pressure. | 10–12 |
| A11 Wild Channel Meadow | Clearing → ecology junction → shared streambank → safe companionship beat → dry service ascent | Root-arch overlook and low fauna bank reconnect at central clearing | Deliberate relief. First subtle hesitation occurs on safe ground and never looks like broken pathfinding. Water turns away downhill while actors climb dry architecture. | 8–10 |
| A12 Sheltered Galleries | Dry stair → monumental entry shelf → gallery junction → hoist shaft → controlled descent → hall connector | Upper gallery/workshop loop rejoins before the shaft | Awe and gradual archaeological discovery. Stable architecture, two distinct graspable lips, clear lower catch shelf. Do not explain full history. | 8–10 |
| A13 Resonant Survey Hall | Read structural frames/crossing → release first counterweight → Moss dry service latch → align remaining frames → settle bridge → safe Moss check | Upper inspection circuit and lower dry trench return to the hall's readable overview | A reversible alignment puzzle: independent frame states, visible mismatch and inspectable linkages. Local resonance confirms alignment only; no energy from Moss. Wrong alignment preserves progress and can be corrected. | 12–15 |
| A14 Ascending Works | Switchbacks → hoist/service fork → reunion before combined traversal → jump/grab/descent sequence → wind breach → R05 threshold | Upper exposed hoist route and protected lower service route rejoin before the final combination | Recombine established skills at modest difficulty. Visible catch shelf, pre-combination checkpoint, and a stable exterior ending. Moss remains capable. | 9–11 |

## Puzzle acceptance, independent of art

For each puzzle specify player knowledge, initial state, visible rule, available actions, intermediate states, success state, wrong-but-recoverable state, and how each actor returns. A hold-progress bar is an input affordance, not the puzzle. Do not duplicate one generic lever → automatic Moss → wheel sequence across every puzzle.

A02 succeeds through observation without mandatory Survey unlock. A05 requires reciprocal rescue and an observable encounter. A09 has separate pressure/access/catch/gate/crossing states. A10 uses distinct actor-scale spatial access. A13 has independently reversible structural alignment rather than a single hold timer. Persist milestones and validate retry at every stage.

## Acceptance gates

1. Calibrate controller, collision-safe climb and camera against measured fixtures. Capture actual frame/apex/reach results.
2. Author and inspect R01 terrain in Godot at gameplay scale, including both optional routes and uninterrupted A01→A03 traversal. Do not interpret this internal milestone as a reduced final scope.
3. Build R02 with the A05 encounter and reliable physical companion routes. Test both directions and each puzzle state.
4. Build distinct R03/R04 layouts and puzzles from the route table. Review the entire route, not isolated developer-selected areas.
5. Run uninterrupted A01→A14 traversal plus checkpoint/load tests. Check companion completion without teleport or player retrieval due to terrain defects.
6. Human playthrough checks control feel, legibility, challenge variation, story pacing and emotional beats. Automatic test counts alone cannot establish acceptance. Record remaining failures honestly before calling the prototype ready for asset replacement.

Current status: Director decisions and proposed route design recorded. The old runtime has NOT yet been rebuilt to this contract. Screen budgets and physics remain proposals pending measurement. No claim of completed replacement terrain, seamless streaming, redesigned puzzles or human acceptance is made by this document.
