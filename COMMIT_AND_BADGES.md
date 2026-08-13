# Commits, push, and GitHub achievements

Owner account: **macbuilds-dev**  
Contribution email: **muhammadammarchaudhry1@gmail.com** (must be verified on GitHub)

## Shortcut: `acp2gh`

User shorthand:

| Token | Meaning |
|-------|---------|
| **a** | add |
| **c** | commit |
| **p** | push |
| **2** | to |
| **gh** | GitHub |

Saying **`acp2gh`** means: stage, commit (logical splits), and push to GitHub now — treating that as explicit permission.

Cursor skill (all projects): `~/.cursor/skills/acp2gh/SKILL.md`  
Project rule template: `templates/.cursor/rules/02-acp2gh.mdc`

## Session hard limit

**Max 29 commits per chat/work session** when the user asks to commit/push (including via `acp2gh`).  
Prefer many small *real* commits. Never empty/junk commits.

**Waiver:** If the user **explicitly** says to overlook / exceed the 29 limit for this ship, do so for that session only. Still prefer many small real commits; never empty/junk commits.

Example waiver (2026-08-12 Pizzio): user set **50** commits + issues/PRs for badges for that ship only.

### Individual `acp2gh` (code repo + AI hub)

When the user asks for **`acp2gh`** on an app **and** its `mac/ai` hub (or “same for mac/ai”):

1. Run **`acp2gh` separately on each dirty git repo** (code checkout, then `ai/projects`, then `vibe-coding` if templates changed).
2. Each repo gets its own logical split — aim for **many small commits up to the 29 session max**, shared across those repos in one chat.
3. Keep hub memory (`docs/ai/`, rules, `COMMIT_AND_BADGES.md`) in the **AI hub repo**, not inside the app clone.

## When user says push / commit / acp2gh

1. Inspect status + diff.
2. Split into logical commits (file or feature sized), ≤ 29 total this session.
3. Prefer a feature branch + PR for Push/merge flow (helps Pull Shark) when appropriate; if user said `acp2gh` on an existing shipping branch (e.g. `main`), push that branch unless they asked for a PR.
4. Show `docs/ai/` memory diffs; wait for OK before committing memory (recommended).
5. Push with `-u` if needed; open PR with `gh pr create` when appropriate.
6. After merge (or if user wants YOLO-style): document what was done in `progress.md`.

## Badge-oriented habits (legitimate)

| Goal | Approach |
|------|----------|
| Contribution graph | Commits with the verified email on default/merged branches |
| Pull Shark | Many merged PRs (small PRs OK) |
| Pair Extraordinaire | `Co-authored-by: Name <email>` with a **second real GitHub user** you control |
| YOLO | Merge your own PR without waiting for review (when you own the repo) |
| Quickdraw | Open then close/merge issue or PR quickly when appropriate |

## Co-authored-by (optional)

Only when a second GitHub identity is intentional:

```
Co-authored-by: OtherName <other@email.com>
```

Do not invent fake co-authors. Set `SECOND_COAUTHOR` in project `docs/ai/decisions.md` if used.

## Anti-patterns

- Empty commits, whitespace-only spam
- Force-push to main unless explicitly requested
- Changing git config in agent sessions
- Exceeding 29 commits in one session (unless the user explicitly waived the cap for that ship)
