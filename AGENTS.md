# AGENTS.md — Codex operating rules for Atlas of the Lonely World

## Purpose
Work on a **small, testable Godot 2D game prototype** first. Game Director approves product, canon, final visuals, and scope. Minimize paperwork and avoid building the full game before a validated vertical slice.

## Required context order
1. `docs/00_MASTER_SOURCE_v1.7.md` — highest written project reference (latest explicit Game Director decision always overrides it).
2. `docs/01_STORY_LORE.md` — narrative/canon boundaries.
3. `docs/02_WORLD_LEVEL.md` and `docs/03_GAMEPLAY_SYSTEMS.md` — gameplay, geography, intended experience.
4. `docs/04_ART_ASSET_PIPELINE.md` and `docs/05_ANIMATION_AUDIO_CINEMATICS.md` — visual and cinematic requirements.
5. `docs/06_GODOT_ENGINEERING.md` — proposed engineering baseline.

**Important:** Labels `APPROVED—DETAIL`, `APPROVED—DIRECTION`, `PROPOSAL`, `OPEN`, `LEGACY` are not interchangeable. Do not invent canon to fill gaps. New details must be flagged `PROPOSAL` until approved.

## Do
- Inspect repository, runtime, existing project files and Git status first.
- Implement small tasks with clear acceptance criteria; prioritize Okto controller → Moss follow → camera → one interaction/puzzle → playable region transition.
- Use placeholder assets if final sprites aren't ready. Preserve responsiveness, readability, and companion reliability.
- Report exactly which files changed, how to run, what tests passed/failed, and what remains open.
- Keep player control during transitions where feasible; use short in-engine staging, not a pre-rendered movie between regions.
- Respect Okto–Moss relationship, H14 instability, H18 two-ending contract, and Game 1 standalone resolution.

## Don't
- Don't rewrite lore or make Moss a Spire key/battery/prophecy figure.
- Don't expose Moss's true name **Oru** during Game 1.
- Don't introduce floating islands, live giant Golems, or specific geography as canon without approval.
- Don't generate hundreds of assets or split documentation into dozens of files.
- Don't run destructive system operations, install tools, or commit/push changes without explicit instruction.
- Don't claim tests passed without actually running them.

## First task to execute when instructed
Inspect the local Godot environment and repo, then implement **one playable greybox room with Okto movement and camera**. Stop after tests and report findings; request permission before expanding scope.
