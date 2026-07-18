# Multi-repo products

When one product spans several repos (e.g. mobile + API + admin):

1. Bootstrap **each** repo from this template.
2. Put a short shared product summary in every repo’s `docs/ai/product.md` (same story, light).
3. Keep stack-specific detail in that repo’s `AGENTS.md` and `.cursor/rules/`.
4. Point across repos with links (GitHub URLs), don’t assume a parent workspace exists.

Do not rely on a workspace-only docs folder as the only memory — clones of a single repo would miss it.
