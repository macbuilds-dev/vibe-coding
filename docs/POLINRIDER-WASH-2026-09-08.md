# PolinRider wash — 7–8 Sep 2026 + how to live after

Canonical living notes from the 7–8 Sep 2026 Cursor session on this Mac (`macbuilds-dev`).  
Technical wash steps stay in [WOFF2-FOLDEROPEN-DROPPER-CLEANUP.md](./WOFF2-FOLDEROPEN-DROPPER-CLEANUP.md). **This file is how to work, how it comes back, and how to prevent it.**

Do **not** copy this file into company trees (`~/mac/createex`, `~/mac/slark`). Hub only.

**Never `node` any `*.woff2`.** Never open a `.INFECTED` folder as a trusted Cursor workspace.

---

## What it is

**PolinRider / TasksJacker family.** Not a different virus. Not something ClamAV “cures.” The implant lives in **git**.

On this estate it looked like:

| Piece | What it does |
|-------|----------------|
| Fake `public/fonts/fa-solid-400.woff2` | ASCII JavaScript (`global.i=…`), not a font |
| Hidden `.vscode/tasks.json` | `eslint-check`, `hide`, `runOn: folderOpen` → `node ./public/fonts/fa-solid-400.woff2` |
| Planted `.vscode/settings.json` | `task.allowAutomaticTasks: true` + SST decoy (`AWS_PROFILE: flo-ct-flo360`) |
| FA camouflage + Blockchain Explorer README | Cover files |
| ~33 KB tails on PostCSS / Babel / Tailwind | Same family, runs on **build** (`next` / `vite` / `postcss`), not only folderOpen |

Markers seen here: `A10-*010` (~8943 B), `A11` (~27414 B), `A10-*020` (32874 B), re-infect ~32645 B, config tails `A10-*1909-10` (~33 KB).

A later stage on some machines used LaunchAgent **`gh-token-monitor`**. **If that agent exists, unload it before revoking GitHub tokens** (revoking first was observed to wipe `$HOME`). On this Mac 7–8 Sep it was **absent**.

---

## What happened (this session)

1. GitHub showed almost every personal + org repo “updated ~18 hours ago” **without you committing**. Cause: mass `PushEvent`s from `macbuilds-dev` on **6 Sep 2026 20:32–20:55 UTC**, reverse-alphabetical, all branches, tips **rewound** (0 new commits). Those older SHAs **already had the kit**. Time-travel is not a wash.
2. Isolated live local trees: `slark.INFECTED`, `PickleBall-Dashboard.INFECTED`, `owalter-app.INFECTED`, `owalter-admin.INFECTED`.
3. Rotated GitHub password + OAuth/SSH/PATs; `gh auth login` as `macbuilds-dev`. Vercel rotated. npm was not logged in. Wallets not confirmed — rotate anything that lived in git or on this Mac.
4. Cursor user setting already: `"task.allowAutomaticTasks": "off"`. Keep it off.
5. History rewrite + force-push **heads and tags only** (never `git push --mirror --force` — GitHub rejects `refs/pull/*`).
6. Font kit: `filter-branch --index-filter 'git rm -r --cached --ignore-unmatch -- public/fonts .vscode'`.
7. Config tails: `filter-branch --tree-filter` that **truncates** at `global.i=` and `rm -rf public/fonts .vscode`. Do **not** put `git rm --cached` inside a tree-filter (missed leftover fonts on wrytify-frontend).
8. Nested configs the first personal scan missed: `student-hub/front-end/postcss.config.mjs` and `Event-Karo-Web-App/web/postcss.config.mjs` (33249 B). Washed 8 Sep. **Root-only path checks are not enough.**

`pickle-ball-app` was force-pushed clean **28 Aug**, then **re-infected** on GitHub before this wash. 404 is not forever.

---

## Status after 8 Sep 2026 morning verify

Writable remotes from this login, **every listed branch, recursive trees** (fonts + folderOpen tasks + any `postcss`/`babel`/`tailwind` config ≥4 KB with `global.i=`):

| Owner | Result |
|-------|--------|
| `macbuilds-dev` | **29/29** clean (nested PostCSS washed during verify) |
| `createex` | **150 clean + 2 empty** (`bookApp_backend`, `InscriptionCustomer`), 0 kit |
| `Slark-labs` | **12/12** clean (second pass: wrytify-admin PostCSS, wrytify-frontend leftover fonts) |
| `sllark` | **33/33** listed collaborator repos clean (DFC trio included) |
| `webmaster-dfc` | **404 from this account.** Cannot wash. Do not `git pull` those remotes |

Local working trees under `~/mac` (23 git clones): **0 live kit**. LaunchAgent match: **none**.

Still dangerous if misused:

- Any `*.INFECTED` folder (working tree stripped; **old commits can still hold tails**).
- `_quarantine/pickleball-backend-kit-forensics` — still has the woff2. **Never node it.**
- `pickle-ball-app` local tree: kit-free **working tree**, uncommitted product, SHA ≠ washed GitHub. **Do not `git pull`.**
- `dfc-admin` local: **HEAD clean** (81 B). Older `webmaster-dfc` commits still contain a removed PostCSS tail. Cannot rewrite that remote from here.

---

## How to work with these repos now

### Rule

**Fresh clone from a washed GitHub remote → Terminal scan → then open in Cursor.**  
Do not “just pull” an old folder that lived through the infection.

### Use these folders

| Work | Path | Notes |
|------|------|--------|
| PickleBall dashboard | `~/mac/createex/pickleball/PickleBall-Dashboard` | Washed clone. Infected sibling **deleted 9 Sep**. |
| pickleball-backend | `~/mac/createex/pickleball/pickleball-backend` | Fresh 9 Sep clone of washed GitHub. Not `_quarantine`. |
| pickle-ball Flutter | `~/mac/createex/pickleball/pickle-ball-app` | Keep uncommitted work. **Do not pull.** To sync GitHub: copy product files into a **new** clone. |
| Owalter app / admin | `~/mac/freelance/owalter-app` and `owalter-admin` | Fresh clones. Not `*.INFECTED`. |
| slark-app | `~/mac/slark/slark-app` | Fresh clone. Not `slark.INFECTED`. |
| Cleaning App | `~/mac/createex/Cleaning-App` | Fresh 8 Sep clone of washed `main`. Not the `_wash-mirrors` bare repo. |
| LMK / equallyyolk / flagged / pizzarating | existing local trees | Kit gone locally since 28 Aug; GitHub now washed; local SHAs still diverge. **Do not pull.** Re-clone if you need to match origin. |
| DFC | `~/mac/slark/dfc/{dfc-admin,dfc-frontend,dfc-backend}` | HEAD kit-free. Origins `webmaster-dfc` — **do not pull**. Real Manrope fonts stay. sllark GitHub copies are washed. |

### Do not open / do not pull

- `~/mac/slark/slark.INFECTED`
- `~/mac/createex/pickleball/PickleBall-Dashboard.INFECTED` — **deleted 9 Sep**; do not restore
- `~/mac/createex/_quarantine/**` — **deleted 9 Sep** (included kit-forensics woff2). Do not restore. Never `node` a `*.woff2` if a copy reappears.
- `~/mac/freelance/owalter-app.INFECTED`, `owalter-admin.INFECTED`
- `~/mac/mac/_wash-mirrors/` — wash scratch, not a workspace

### Day-to-day

1. Keep Cursor **`task.allowAutomaticTasks`: `"off"`** (user settings).
2. New clone or new machine: **Terminal scan first** (commands below). Then install. Then open Cursor.
3. After `git pull` / `git fetch` from GitHub: scan again. This kit was **re-planted after a successful 404**.
4. Do not copy `.env`, keystores, `google-services.json`, or wallet files from a dirty/INFECTED folder into a new clone.
5. `flagged-app`: keep real `public/.well-known` / auth HTML. Do not `rm -rf public/`.
6. DFC frontend: keep real Manrope `.otf`. Do not wipe all of `public/fonts`.
7. Company code stays free of AI hub files. Memory lives only under `~/mac/ai`.

---

## How it comes back (prevention)

The wash does **not** make you immune.

| Vector | What to do |
|--------|------------|
| Open `.INFECTED` or an old clone in Cursor | Don’t. `folderOpen` can still fire if tasks + fake font remain in that checkout or an old commit you check out. |
| `git pull` / `git fetch` into a mixed tree | Re-clone after a remote wash. Pulling dirty history re-infects. Pulling a washed remote into a rewritten-local tree can also smash uncommitted work. |
| Nested config dropper | Scan **any** `postcss.config.js/.mjs`, `babel.config.js`, `tailwind.config.js/.cjs` **anywhere** in the tree (e.g. `web/`, `front-end/`). Size ≥ ~4 KB + `global.i=` = kit. Font 404 is **not** a clean bill. |
| `npm run` / `vite` / `next` on a dirty config | Config tails run at **build**, not only folderOpen. Don’t install/run until configs are tiny and have no `global.i=`. |
| Stolen GitHub token / password | Already rotated once. If anything looks mass-pushed again, **rotate again**, then scan. Restrict who can force-push. |
| LaunchAgent `gh-token-monitor` | Check before token revoke. Unload first if present. |
| Someone else’s laptop | Cleaning **your** GitHub does not clean **their** clone. They must scan + re-clone. |
| Weekly silence | Re-scan GitHub (recursive trees, nested configs) on a schedule. `pickle-ball-app` proved 404 can reverse. |

---

## Scan every clone (Terminal, before Cursor)

From the clone root. Read-only. Do not execute hits.

```bash
# 1. Fake JS font
find . -name 'fa-solid-400.woff2' -not -path '*/.git/*' -not -path '*/node_modules/*'

# 2. Camouflage FA set
find . -path '*/public/fonts/fa-*' -not -path '*/.git/*'

# 3. Launcher
find . -path '*/.vscode/tasks.json' -not -path '*/.git/*'
grep -R -n -E 'folderOpen|allowAutomaticTasks|fa-solid-400\.woff2|eslint-check|A10-\*010|A10-\*020|A10-\*1909-10|A11--#' \
  --include='*.json' --include='*.woff2' --include='README.md' \
  --exclude-dir=.git --exclude-dir=node_modules .

# 4. Config tails — ANY path, not only repo root
find . \( -name 'postcss.config.js' -o -name 'postcss.config.mjs' \
  -o -name 'babel.config.js' -o -name 'tailwind.config.js' -o -name 'tailwind.config.cjs' \) \
  -not -path '*/.git/*' -not -path '*/node_modules/*' -print0 \
  | xargs -0 -I{} sh -c 'wc -c "$1"; grep -l "global.i=" "$1" 2>/dev/null' _ {}
```

- Real leftover configs after a wash are **tiny** (~70–1400 B) and have **no** `global.i=`.
- Kit configs are **~33 KB**.
- Classify a `.woff2` with `file`: magic `wOF2` = font; ASCII / `require(` / `eval` = malware. **Do not run it.**

GitHub (no trusted clone):

```bash
# 404 = absent on that ref. Repeat other branches. Nested paths too.
gh api repos/OWNER/REPO/contents/public/fonts/fa-solid-400.woff2
gh api repos/OWNER/REPO/contents/.vscode/tasks.json
gh api repos/OWNER/REPO/contents/front-end/postcss.config.mjs
gh api repos/OWNER/REPO/contents/web/postcss.config.mjs
```

Better: recursive tree on **every branch**, then flag any of those filenames with size ≥ 4000 and `global.i=` in the blob.

If `gh-token-monitor` appears in `~/Library/LaunchAgents` or `launchctl list`: **stop it before rotating GitHub tokens.**

---

## ClamAV (extra — already installed 8 Sep)

Full how-to (install, `freshclam`, clone scan, weekly machine scan): [CLAMAV.md](./CLAMAV.md).

- This Mac: Homebrew **1.5.4** under `/usr/local`. Config: comment `Example` in `freshclam.conf` / `clamd.conf` samples.
- 8 Sep scan of `~/mac`, LaunchAgents, Downloads, Desktop: **0 infected**. Known forensics woff2: **not flagged**.
- Order: IOC grep **first**, then `freshclam` + `clamscan`. 0 ClamAV hits ≠ kit gone.
- Do not rely on `sudo brew services start clamav` unless you want a daemon.

---

## If you find it again

1. Do not open the folder in Cursor. Do not `npm` / `pub` / `pod`. Do not `node` the woff2.
2. Isolate: rename to `.INFECTED`.
3. Check LaunchAgent. Unload if present.
4. Rotate GitHub (and anything that lived in that repo).
5. Wash **GitHub history on all branches/tags**, then **re-clone**. A delete commit on `main` is not enough. Rewinding to an “old” SHA is not enough if that SHA already had the kit (6 Sep push).
6. Force-push **heads + tags only**. Unset `remote.origin.mirror`. Never `--mirror --force`.
7. Verify 404 / tiny configs / no `global.i=` on **all branches**, including **nested** config paths.
8. Do not pull the old tree. Re-clone. Scan in Terminal. Then open.

---

## Wash mechanics (short)

Full commands: [WOFF2-FOLDEROPEN-DROPPER-CLEANUP.md](./WOFF2-FOLDEROPEN-DROPPER-CLEANUP.md).

- Font kit: index-filter remove `public/fonts` + `.vscode` (keep real fonts / `.well-known` when those exist).
- Config kit: tree-filter strip at `global.i=` + `rm -rf public/fonts .vscode` (not `git rm --cached` inside the tree-filter).
- Then: unset mirror, `git push --force origin 'refs/heads/*:refs/heads/*'` (+ tags if any).
- Verify, then re-clone.

---

## Related files in this hub

| File | Role |
|------|------|
| `vibe-coding/docs/CLAMAV.md` | Install, `freshclam`, clone + weekly `clamscan`. Extra only. |
| `vibe-coding/docs/WOFF2-FOLDEROPEN-DROPPER-CLEANUP.md` | Locate / strip / force-push playbook |
| `vibe-coding/.cursor/rules/00-clone-malware-scan.mdc` | Fresh-clone gate |
| `vibe-coding/.cursor/rules/00-woff2-folderopen-dropper.mdc` | IOC list + scan |
| `projects/createex/pickle-ball-app/docs/ai/active.md` | Pickle Ball local layout after wash |
| `projects/README.md` | Company trees stay free of AI files |

Payload bytes are **not** stored in these docs on purpose.
