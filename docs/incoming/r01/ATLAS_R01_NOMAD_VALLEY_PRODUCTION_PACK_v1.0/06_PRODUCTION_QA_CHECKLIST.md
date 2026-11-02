# ATLAS OF THE LONELY WORLD — R01 NOMAD VALLEY
**Production Pack v1.0 | 2026-11-01 | Game Director decisions locked**

**Scope:** A01 Nomad Settlement, A02 Survey Ridge, A03 Cliff Passage / First Horizon Reveal. **Not** R02 art production. **Authority:** latest Director intake v2.0 and visual-narrative update > compatible A01–A07 greybox/opening blueprints > older world master/proposals. This is a production specification, not a rewrite of lore. Values marked `CALIBRATE` are test hypotheses, not approved engine measurements.

## Production QA Checklist

### Narrative
- [ ] A01 looks like a very small inhabited hamlet, not a fortress/city/market.
- [ ] Okto home high on slope; old tree, communal terrace, sheltering cliff visible.
- [ ] Sparse life and minimal cloth motifs; no obvious Golem relics/excavation/neon.
- [ ] A02 alignment purely natural and observational; outside vista concealed.
- [ ] A03 first horizon reveals fractured Broken Crossing, not R03 beauty.
- [ ] Moss absent A01–A03; no invented lore or combat.

### Level / camera
- [ ] All three areas follow module sequence and branch-rejoin contract.
- [ ] A01 has two distinct optional viewpoints, each short and rejoining.
- [ ] A01 contains no fatal fall and has readable move/jump/climb onboarding.
- [ ] A02 brittle shelf warns visually, then safely recovers; Survey formations distinguishable at camera scale.
- [ ] Wrong Survey path loops back; hidden exit discoverable through alignment.
- [ ] A03 ledge, descent, dark passage, controlled reveal, stable post-reveal ground.
- [ ] Player remains in control except authored minimal transition moments; camera does not expose vista early.

### Assets / engine
- [ ] Sprite master Okto and collision height independently measured; same feet pivot in every animation.
- [ ] 5 layer groups render correctly at target and lower viewport.
- [ ] Terrain edges seam-free; collision follows greybox, not texture alpha.
- [ ] No blur, oversized source texture, alpha halos or overdraw issues.
- [ ] All asset IDs in manifest map to real exported files before marking `done`.
- [ ] Input keyboard/gamepad and prompts work; state triggers idempotent.
- [ ] Checkpoints and recoverable failure tested; no soft-lock.
- [ ] Art review screenshots at 1920×1080 and 1280×720.

### Gate
`G0` source+intake accepted; `G1` Okto/camera CU calibrated; `G2` all A01–A03 P0 greyboxes playable; `G3` modular asset integration and readability pass; `G4` atmospheric/FX polish and QA; `G5` freeze R01 for R02 handoff. Concurrent asset production does not waive gates.
