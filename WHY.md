# Why prepare a project for vibe coding

AI tools forget chat history. They also invent stack changes unless you constrain them.

**Preparation** = short markdown the agent must follow:

1. **Rules** (`AGENTS.md`, `.cursor/rules/`) — constraints and conventions (change rarely)
2. **Memory** (`docs/ai/`) — product state and current focus (change often)
3. **Human review** — especially memory diffs before commit

Keep files light. Prefer pointers and bullets over essays. One concern per rule file.
