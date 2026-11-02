# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Environment Visual Bible

### Emotional art arc
A01 **belonging** (warm morning, shelter, quiet life) → A02 **curiosity** (airier, exposed, fewer houses) → A03 **departure/unease** (tight, shadowed, colder light at exit). Reserve dark broken frontier for R02, lush revelation for R03, historical Golem spectacle for late R03/R04.

### Palette (art targets, not compulsory exact sampling)
| Material/light | Base | Shadow | Highlight | Usage |
|---|---|---|---|---|
| Warm limestone | `#9B927B` | `#565C57` | `#D9C9A4` | terraces, low steps |
| Aged timber | `#78634B` | `#413B32` | `#B49469` | beams, doors, bridges |
| Grass sage | `#82956B` | `#435A4C` | `#C3BC73` | sparse grass slopes |
| Earth | `#A38B69` | `#64594A` | `#CFB28A` | paths, exposed banks |
| Plain textiles | `#B7A88A` | `#776C60` | `#E3D2AD` | canopies, laundry |
| Sky/air | `#8DAFBA` | `#5D8495` | `#E7D8B4` | far mountains/atmosphere |
| A03 stone | `#6B706C` | `#323D40` | `#9C9D8C` | compressed passage |

Do not render every item saturated. Reserve brighter accents for one or two focal items (doorcloth, flower, sunlit rim). Avoid bright neon glyphs, giant rings, monumental gates, giant golem silhouettes, decorative motifs everywhere.

### Silhouette and composition hierarchy
1. Player collision and active ledge > 2. immediate terrain route > 3. landmark/viewpoint > 4. settlement props > 5. painterly vista. Keep interactive ledge top line legible against backdrop at full and downscaled 720p views.

### Architectural grammar
Small, imperfect local houses: low stone footings, rough timber frames, plaster/clay patches, plain woven covers, simple pitched roofs, rainwater spouts, tiny windows. No fortress walls, elaborate temple portals, towers dominating the skyline, repeated grand arches, high-tech excavation. Scale houses from Okto CU after calibration; do not infer meters from illustration.

### A01 key landmarks
- **Old tree:** asymmetrical broad canopy, root-wrapped terrace edge, recognizable from home path and first optional vista.
- **Communal terrace:** compact open work/rest platform, a few benches/low walls; not a marketplace.
- **Enclosing cliff:** protective backdrop with natural horizontal strata and sparse rooted shrubs.
- **Okto house:** upper slope, stone/wood, modest threshold; interior cartography visible only if supported by opening cinematic; gameplay begins at exterior doorway.

### Ecology by area
A01 cultivated grass, vegetable plots, one old tree, shrubs, small stream as optional background motif (do not add unapproved water gameplay). A02 shorter grass, wind-bent shrubs, exposed stone and scree. A03 moss only where damp, sparse roots, gravel, darker bare stone. No dense R03 jungle.

### Five visual groups (back to front)
`BG_SKY` distant sky/cloud gradient; `BG_FAR` far enclosing mountains; `BG_MID` hamlet/cliff silhouettes and vegetation; `GAMEPLAY` all collision-bearing terrain and interactables; `FG` limited framing plants/rocks, never cover prompts or hazards. Parallax factors are `CALIBRATE` per camera test; do not animate background faster than player-readable motion.

### Lighting
A01 soft angled morning light, baked large form shadows; A02 brighter open ridge with cooler shade; A03 compressed shade and a cooler rim at exit. Runtime: sparse dust, cloth sway, leaf movement, low-intensity light shafts. Keep accessibility modes for reduced motion and camera shake. Never hide traversal silhouettes in atmospheric bloom.

### Material asset paint guide
Stone: uneven sediment strata, chipped edges, no precision metal seams. Wood: broad directional grain, rough joins, slight wear. Cloth: mostly undyed, subtle weave, low motif density. Soil: large readable patches, avoid noisy pixel-scale detail. Vegetation: clumps rather than continuous carpet. For every material, produce **playable**, **midground**, and **distant** detail tiers.

### Art acceptance
At actual camera zoom, Okto remains recognizable; route readable without arrows; no obvious Golem-history disclosure; A01 and A02 feel related; A03 is darker but still playable; village appears inhabited through at least three subtle ambient details, not crowds.
