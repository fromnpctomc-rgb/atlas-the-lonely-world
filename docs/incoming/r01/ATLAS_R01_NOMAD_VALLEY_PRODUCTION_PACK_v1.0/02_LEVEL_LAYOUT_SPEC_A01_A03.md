# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Level Layout Specification

### Coordinate convention
+X = forward/progression (screen-right), +Y = down in Godot. **1 CU = Okto standing collision height** (not sprite texture height). Use normalized schematic geometry until controller and camera are measured. Initial camera target ~5 CU high, Okto ~18–22% viewport height; all `CALIBRATE`. Comfortable jump J measured from real controller; first mandatory gaps around 0.55–0.75 J, subject to playtest. No numerical engine coordinates are claimed final.

### A01 topology — HOME → QUIET TERRACE → RIDGE FOOT
| Module | Visual | Playable task | Recovery/trigger |
|---|---|---|---|
| A01-M01 | Okto upper-slope doorway, valley beyond | Spawn and move/run onboarding | Safe flat ground; `T-CONTROL-A01` |
| A01-M02 | scattered cottages, plain cloth, one distant resident | gentle lane + short step/jump | no fatal fall |
| A01-M03 | old tree and communal terrace | climbable lip/ledge grab, gentle terracing | stable landing |
| A01-M04 | optional pocket V1: village life | short branch/rejoin | short-screen return |
| A01-M05 | outer terrace and small bridge | low-risk traversal | no fatal fall |
| A01-M06 | optional pocket V2: valley panorama | short branch/rejoin | no story bypass |
| A01-M07 | rock path at ridge foot | exit toward A02 | checkpoint `T-RIDGE-ENTRY` |
**Composition:** player starts on high left, gently descends/levels through hamlet, then rises toward ridge; do not force an exact elevation until greybox test. Three ambient inhabited details across depth layers: chimney/smoke, tended plants, distant worker, moving cloth; not a crowd.

### A02 topology — TERRACES → SURVEY → CONCEALED GAP
| Module | Visual | Playable task | Recovery/trigger |
|---|---|---|---|
| A02-M01 | grassy slope with stone shelves | simple jumps | stable approach |
| A02-M02 | cracked stone shelf | delayed reaction and fall | recoverable lower landing |
| A02-M03 | exposed rock ascent | ledge grab/climb | checkpoint before exposed segment |
| A02-M04 | lookout with three natural silhouettes | contextual Survey (no magical scan) | `T-SURVEY-AVAILABLE`, `T-SURVEY-LOG` |
| A02-M05 | two plausible routes | wrong branch returns, alternate view | target 30–50 s return `CALIBRATE` |
| A02-M06 | concealed geological fracture | route discovery by alignment | `T-EXIT-DISCOVERED` |
**Three formation production IDs (not lore names):** `SV_SPLIT_CROWN` (forked), `SV_TILTED_NEEDLE` (leaning), `SV_CUT_STONE_WITNESS` (broad fractured face). All must look **natural**, despite historical placeholder name; no ancient glyphs or magical lights. Spatial arrangement must be validated with camera before art is baked. No view into R02 from A02.

### A03 topology — CLIFF LEDGE → DARK PASSAGE → FIRST HORIZON
| Module | Visual | Playable task | Recovery/trigger |
|---|---|---|---|
| A03-M01 | narrow cliff exterior | careful lateral movement | safe approach |
| A03-M02 | overhanging natural lip | grab/climb | stable landing |
| A03-M03 | short shaft and descending rock shelves | controlled descent | checkpoint before difficulty |
| A03-M04 | weathered weak stone seam | visible warning, delayed failure | recoverable lower shelf |
| A03-M05 | 1–2 screens tight dark geological passage | walk/crouch if controller supports; no forced new global mechanic | no enemy or Moss cues |
| A03-M06 | outside threshold | camera widens to fractured ravine + broken span | `T-HORIZON-CAMERA`, `T-HORIZON-MAP`; stable standing zone |
**Reveal staging:** compression (camera tight, sound muffled) → threshold (cold air/light) → release (wide broken frontier) → afterglow (control, optional pause). No white flash, no R03 lush vista, no Golem remains. If crouch not in controller, use an authored passage traversal animation without falsely claiming mechanic already exists.

### Cross-area level design
One main spine with short branch-and-rejoin, no open world. In-world silhouettes/lighting guide traversal; no floating objective arrows. Keep two optional viewpoints in A01 and short wrong-route return in A02. Camera must not spoil the horizon before A03 threshold. No combat, no death pits in A01, no untelegraphed collapse. Each hazard has approach/read space, response interval, safe consequence/recovery, and checkpoint.

### Required state & trigger contract
`A01_START`, `VISTA_VILLAGE_SEEN`, `VISTA_VALLEY_SEEN`, `A02_ENTERED`, `SURVEY_AVAILABLE`, `SURVEY_COMPLETED`, `A02_EXIT_FOUND`, `A03_ENTERED`, `A03_HORIZON_SEEN`, `R02_READY`. Actual persistent-save keys are implementation choices; keep events idempotent and map only what Okto has seen.

### Greybox diagram keys
See `A01_LAYOUT.svg`, `A02_LAYOUT.svg`, `A03_LAYOUT.svg`. They are **topology diagrams, not production collision polygons**. Blue arrows are player route, dashed paths optional; boxes represent traversal modules, not literal rooms.
