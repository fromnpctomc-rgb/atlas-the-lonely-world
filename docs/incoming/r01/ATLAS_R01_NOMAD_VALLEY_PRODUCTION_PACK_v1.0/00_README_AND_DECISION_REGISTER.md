# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Read me / decision register

### Approved director decisions
- **Art:** Cinematic Stylized Painterly; 2D side-on gameplay, layered 2.5D backgrounds; gameplay plane clear and moderately detailed.
- **Story pacing:** R01 = home, quiet life, curiosity, departure; R02 = dark dramatic broken border; R03 = return of beauty; recognizable Golem remains and history clues only toward end of R03, much more in R04. No overt Golem anatomy, excavations, glowing symbols, alien machines, or giant monumental ruins in R01.
- **A01:** very small scattered hamlet, intimate, sparse NPCs; stone-and-timber houses, minimal ornament and mostly plain cloth; tents/canopies secondary. Okto house on upper slope overlooking settlement. Old tree + communal terrace + enclosing cliff = identity triad. Gentle terraced route, short steps, small bridges; two optional viewing pockets (village life / valley panorama).
- **A02:** grassy ascent becomes exposed rock; three distinctly silhouetted natural Survey formations; nonmagical in-world alignment.
- **A03:** natural cliff cleft, vegetation thins, dark narrow passage, no large ancient ruin; camera widens at exit to reveal ravine and broken bridge, not Golem or R03 splendor.
- **Asset strategy:** hybrid modular terrain, unique cliff pieces, separate decoration; five visual layer groups; main illumination baked into art, restrained runtime atmosphere and local effects; all A01–A03 asset families produced in parallel, with staged Godot verification.
- **Technical:** existing Godot project/controller preserved; reported Godot version **4.7.2** (verify installed binary/project settings before relying on version-specific features); 1920×1080 16:9 initial presentation target, also test smaller resolutions; desktop keyboard/gamepad first. Reported Okto sprite/collision value **128 px**, ambiguous which dimension: DO NOT equate texture pixels with collision without inspecting scene. Use collision-height Character Units (CU).

### Non-negotiable continuity
- A01 no fatal falls; two short optional recesses rejoin main route; inhabited but quiet; no village quest hub; Okto leaves without public farewell.
- A02 safe recoverable brittle shelf; Survey viewpoint with three formations, two plausible candidates, short dead-end returning; map inspection not mandatory; no outside-world view before A03.
- A03 ledge/grab/descent/short dark passage, one visibly warned failing masonry/rock element with recovery; player-controlled first horizon reveal; safe standing zone beyond exit.
- No Moss anywhere in A01–A03. No combat, dash, double jump, magical Survey or persistent HUD.

### Scope/approval semantics
Creative choices above are LOCKED. Greybox timings, pixel scale, jump measurements, and actual engine APIs are `CALIBRATE`. Older blueprint's A03 *remnant Accord masonry* is treated as a **small, ambiguous weathered local stonework trace**, not monumental ancient reveal; avoid labeling it historically in-game. If this conflicts with final story canon, omit it rather than inventing lore.

### Package index
01 Visual Bible; 02 Level Layout; 03 Asset Kit; 04 Godot Integration; 05 CSV Asset Manifest; 06 QA Checklist; 07 Production Schedule; 08 source/decision trace; three SVG schematic diagrams. These diagrams are topology, not pixel-accurate maps.
