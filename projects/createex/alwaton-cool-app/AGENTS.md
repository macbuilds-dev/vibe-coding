# AGENTS.md

> Filled per project. Keep under ~150 lines.

## Product

- Name:
- One-liner:
- Related repos:

## Stack

- Language / framework:
- Package manager:
- Node version:

## Commands

```bash
# install
# dev
# test
# build
```

## Layout

```
src/   # …
```

## Do not

- Run package installers on a **fresh clone** until `.cursor/rules/00-clone-malware-scan.mdc` passes
- Commit secrets (`.env`, key files)
- Drive-by refactors unrelated to the task
- Change public API shapes without updating callers + `docs/ai/`

## Memory

- Before non-trivial work: read `docs/ai/active.md` and this file
- After meaningful work: update `docs/ai/active.md` and `docs/ai/progress.md`
- Show memory file diffs before committing them (recommended)

## Commits / push

Follow the vibe-coding template `COMMIT_AND_BADGES.md`: max **29** commits per session; prefer PR workflow.

Shortcut: user says **`acp2gh`** → add, commit, push to GitHub (see rule `02-acp2gh.mdc` / skill `acp2gh`).
