# vibe-coding

Generic template for AI-assisted (“vibe”) coding on any project.

**Owner:** [macbuilds-dev](https://github.com/macbuilds-dev)

## What this is

| Piece | Role |
|-------|------|
| This repo | How + why + empty skeletons |
| Your product repos | Filled copies + living memory |

Do **not** put client/product secrets or live progress only here. Progress lives in each project’s `docs/ai/`.

## Quick start

```bash
# from a new or existing project root
bash /Users/mac/mac/ai/vibe-coding/scripts/bootstrap-project.sh .
# then fill docs/ai/*.md and AGENTS.md with project facts
```

See [SETUP.md](./SETUP.md), [WHY.md](./WHY.md), [MULTI_REPO.md](./MULTI_REPO.md), [COMMIT_AND_BADGES.md](./COMMIT_AND_BADGES.md).

## Layout

```
vibe-coding/
  README.md
  WHY.md
  SETUP.md
  MULTI_REPO.md
  COMMIT_AND_BADGES.md
  scripts/bootstrap-project.sh
  templates/
    AGENTS.md
    docs/ai/{product,architecture,decisions,active,progress,lessons}.md
    .cursor/rules/{00-memory-workflow,01-commit-push,02-acp2gh}.mdc
```

Personal Cursor skill (all repos): `~/.cursor/skills/acp2gh/` — triggered by user saying **`acp2gh`** (add → commit → push to GitHub, max 29 commits/session).
