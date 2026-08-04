# Multi-repo products

When one product spans several repos (e.g. mobile + API + admin):

1. Bootstrap **each** repo from this template.
2. Put a short shared product summary in every repo’s `docs/ai/product.md` (same story, light).
3. Keep stack-specific detail in that repo’s `AGENTS.md` and `.cursor/rules/`.
4. Point across repos with links (GitHub URLs), don’t assume a parent workspace exists.

## Code checkout + AI hub

Createex (and similar) apps live in the **code clone**; memory/rules live under `mac/ai/projects/...`.

On **`acp2gh`** for both:

1. Ship the **app repo** first with small logical commits (≤ session max **29** total).
2. Ship the **`ai/projects`** hub separately with its own small commits (same session budget).
3. Ensure each hub has `02-acp2gh.mdc` + `COMMIT_AND_BADGES.md` (max **29** / session).
4. Do not copy hub `AGENTS.md` / `docs/ai` into the app clone.

Do not rely on a workspace-only docs folder as the only memory — clones of a single repo would miss it.
