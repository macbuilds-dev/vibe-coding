# Setup — bootstrap any project

## 1. Copy templates

```bash
bash /Users/mac/mac/ai/vibe-coding/scripts/bootstrap-project.sh /path/to/project
```

Or manually copy everything under `templates/` into the project root.

## 2. Fill project facts (required)

Edit in the project:

- `AGENTS.md` — stack, commands, do-nots
- `docs/ai/product.md` — what / who / core flows
- `docs/ai/architecture.md` — how pieces connect
- `docs/ai/active.md` — current focus
- `docs/ai/progress.md` — done / left / blockers

Optional: `decisions.md`, `lessons.md`.

## 3. Verify Cursor sees rules

Open the project in Cursor → Settings → Rules. You should see project rules from `.cursor/rules/`.

## 4. First session ritual

1. Read `docs/ai/active.md` + `AGENTS.md`
2. Do the work
3. Update `active.md` / `progress.md` (show memory diff before commit — recommended)
4. On “push”: follow [COMMIT_AND_BADGES.md](./COMMIT_AND_BADGES.md) (max **29** commits per session)

## 5. Multi-repo products

See [MULTI_REPO.md](./MULTI_REPO.md).

## Existing projects (already have trackers)

If the repo already has phase trackers, QA PDFs, contrib logs, etc.:

1. Create `old-stuff/` and **move** (do not delete) those files there.
2. Keep a short `old-stuff/README.md` index.
3. Copy the important facts into `docs/ai/` (active, progress, decisions, lessons).
4. Point `AGENTS.md` at `old-stuff/` for deep history.

Living AI memory stays in `docs/ai/`. Archives stay in `old-stuff/`.
