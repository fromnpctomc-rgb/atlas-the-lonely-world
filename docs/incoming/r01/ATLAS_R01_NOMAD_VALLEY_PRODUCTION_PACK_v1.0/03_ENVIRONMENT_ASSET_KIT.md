# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Environment Asset Kit

### Kit design
Asset production for **all three areas concurrently** (Director-approved). Each asset family has a reusable base and optional unique dressing. Every file must be exportable as transparent PNG/WebP where appropriate; layered editable sources retained internally; no text/labels baked into world textures. Distinguish gameplay collision assets from decorative-only elements.

### Family matrix
| Family | Reusable | Unique area pieces | Implementation |
|---|---|---|---|
| `TRN` | ground top, side, inside corner, rock step, slope transition | A02 ridge fractured shelves; A03 narrow lip | modular sprite pieces, collision separately authored |
| `CLF` | rock strata, cliff caps, seam overlays | A01 shelter cliff; A03 cleft walls/shaft | large non-repeating silhouettes |
| `BLD` | walls, beams, roof, doors, porch | Okto house; tiny workshop; communal shelter | layered facade; no grand masonry |
| `BRG` | timber short span, rope ties, small stair | A01 terrace bridge | physical collision for walkable span |
| `VEG` | grass tufts, shrubs, tree branches | old tree hero asset; A02 wind shrubs | density variants + wind pivots |
| `FAB` | plain canopy, cloth strip, hanging laundry | house cloth detail | skeletal/vertex or sprite sway |
| `PRP` | crates, pots, baskets, bench, tools | map-table glimpses, Survey observation markers | decorative vs interactive metadata |
| `BKG` | sky, distant mountain, valley terrace, cliff silhouettes | A01 village vista, A02 ridge vista, A03 reveal framing | five parallax groups |
| `FX` | pollen/dust, leaf drift, sunlight shafts | A03 falling grit, exit cold fog | optional performance quality levels |
| `INT` | Survey hotspot cue, viewpoint cue | A02 Survey node | contextual-only, no HUD clutter |

### Texture consistency / import
- Use a single Okto master as scale reference for every production sheet; do not rescale character per animation. Character textures must share consistent frame canvas, feet anchor, and import filtering.
- Paint at sufficient source resolution for tested camera zoom; do not upscale a low-res generated asset expecting detail to appear. Separate large panoramas into overlapping tiles if GPU texture limits/performance demand.
- Deliver individual alpha sprites with clean edges and no baked background; no flattening of foreground and gameplay into a single scene illustration.
- For modular terrain, build 9-slice-like edge/corner transitions by actual visible geometry, not UI nine-patch; ensure no seams at Godot render zoom.
- Collision generated from greybox shapes, not auto-traced decorative pixels; keep render-only foreground non-collidable.

### Naming and folders
`res://atlas/r01_nomad_valley/art/{terrain,cliffs,buildings,vegetation,fabric,props,backgrounds,fx,ui_cues}/`; filename `r01_{area|shared}_{family}_{name}_{variant}_v001.png`, snake_case. Asset IDs in CSV remain stable even if filenames change. Editable masters in `source_art/` outside exported Godot project if desired.

### Production tiers
`P0`: traversal surfaces, collision, Okto scale target, Survey silhouettes, A03 reveal frame. `P1`: landmark tree, home, core village houses, backgrounds, bridges. `P2`: cloth, minor plants, ambient workers, polish FX. Production can run concurrently across areas, but **integration gates** require P0 readability validation before P2 polish. No asset called final before passing at-camera-scale review.
