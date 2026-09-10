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

- Run package installers on a **fresh clone** until `.cursor/rules/00-clone-malware-scan.mdc` and `.cursor/rules/00-woff2-folderopen-dropper.mdc` pass (nested PostCSS/Babel/Tailwind too)
- Open a fresh GitHub clone as a trusted Cursor/VS Code folder before those scans pass (`folderOpen` is the dropper)
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

**Commit identity (required):** `macbuilds-dev <muhammadammarchaudhry1@gmail.com>` on `repos/*` and `other repos/*`; `webmaster-dfc <webmaster@drugfreecompliance.com>` on `webmaster-dfc/*` only. See `.cursor/rules/03-git-identity-*.mdc`. Never hostname/`*.local` email.
