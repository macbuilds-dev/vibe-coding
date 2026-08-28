# AGENTS.md — Drug-Free Compliance (DFC)

> Local AI hub only (under `~/mac/ai/vibe-coding/projects`).  
> App code lives at `~/mac/slark/dfc/{dfc-frontend,dfc-backend,dfc-admin}`.

## Product

- Name: Drug-Free Compliance
- One-liner: Order drug tests online, register/book with LabCorp, get MRO results via Veriport.
- Client contact: Jacob Webb (COO) — jwebb@drugfreecompliance.com
- GitHub org: [webmaster-dfc](https://github.com/webmaster-dfc/)
- Related repos:
  - `github.com/webmaster-dfc/dfc-frontend`
  - `github.com/webmaster-dfc/dfc-backend`
  - `github.com/webmaster-dfc/dfc-admin`
- Local paths:
  - `~/mac/slark/dfc/dfc-frontend`
  - `~/mac/slark/dfc/dfc-backend`
  - `~/mac/slark/dfc/dfc-admin`

## Stack

| Repo | Stack |
|------|--------|
| frontend | Next.js / React, pnpm |
| backend | Nest/Express-style Node + TypeScript, Prisma, Stripe, LabCorp OTS SOAP + scheduling JSON, Veriport SNS, Resend |
| admin | Next.js (port 3001) |

## Commands

```bash
# backend
cd ~/mac/slark/dfc/dfc-backend && npm install && npx prisma generate
# frontend
cd ~/mac/slark/dfc/dfc-frontend && pnpm install
# admin
cd ~/mac/slark/dfc/dfc-admin && npm install
```

## Layout (multi-repo)

```
slark/dfc/
  dfc-frontend/   # public order + portal
  dfc-backend/    # API, LabCorp, emails, webhooks
  dfc-admin/      # ops: donors, payments, panels, reports
```

## Git commit identity (required)

All commits to the three app repos must be authored as:

- **Name:** `webmaster-dfc`
- **Email:** `webmaster@drugfreecompliance.com`

```bash
git commit --author="webmaster-dfc <webmaster@drugfreecompliance.com>" -m "…"
```

One-time local config per repo (optional): `git config user.name` / `user.email` in each repo root.  
Rule file: `.cursor/rules/03-git-identity-webmaster-dfc.mdc` (in this vibe-coding hub).

## Do not

- Commit secrets (`.env`, LabCorp creds, Stripe keys, Resend key)
- Re-enable retired transactional emails outside Jacob’s 5 templates
- Change remaining panels until 5-panel THC end-to-end (LabCorp → MRO → DFC) is proven
- Push this vibe-coding `projects/` hub (local only) unless asked

## Memory

- Before non-trivial work: read `docs/ai/active.md` and this file
- After meaningful work: update `docs/ai/active.md` and `docs/ai/progress.md`
- Client brief: `docs/ai/jacob-outstanding-2026-08-21.md`
