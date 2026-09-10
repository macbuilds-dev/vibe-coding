# WOFF2 / folderOpen dropper — Createex playbook

For **github.com/createex** and **every local clone** of those repos.  
Share this with each owner so they clean **their** GitHub remotes **and** the copies on their laptop.

Incident window: **27–28 Aug 2026**, then **re-infection + 6 Sep 2026 mass SHA rewind**, then **7–8 Sep 2026 wash** from `macbuilds-dev`. Same kit (PolinRider / TasksJacker family) was planted in many unrelated apps (Flutter, Nest, HTML, meta-repos) across createex, personal, Slark-labs, and sllark.

**How to work and prevent after the wash:** [POLINRIDER-WASH-2026-09-08.md](./POLINRIDER-WASH-2026-09-08.md).

**Do not run the payload.** Scan with `file` / `grep` / `find` / `gh api` only. **Never** `node` any `*.woff2`.

---

## Does this file cover every concern?

| Concern | Local laptop | GitHub (`createex/*`) |
|---------|----------------|------------------------|
| **Why** locate | Opening the folder as a trusted Cursor/VS Code workspace **runs the trojan on that machine** | A clone/pull from GitHub **re-infects** the next person |
| **Where** to locate | Every git checkout of `github.com/createex/<repo>` on disk | Every repo under the Createex org (default branch **and** other branches/tags) |
| **What** to locate | Fake font + camouflage `public/fonts/fa-*` + planted `.vscode` | Same paths on the remote (contents API / after a **non-trusted** clone) |
| **How** to locate | Terminal `find` / `grep` / `file` — **do not** open as trusted workspace first | `gh api repos/createex/NAME/contents/...` (404 = absent on that ref). Do not clone into Cursor first |
| **What / why** to remove | Working-tree files **and** local git history | Remote history on **all** branches/tags. A delete commit on `main` is **not** enough |
| **How** to remove | Delete kit + `git filter-branch` on that clone (below) | Bare `--mirror` clone + rewrite + **force-push heads and tags only** |
| **Verify** | `find` returns nothing; `git log --all -- public/fonts` and `-- .vscode` are **0**; configs tiny and no `global.i=` **anywhere** in the tree | `gh api` **404** for font/tasks; leftover postcss/babel/tailwind tiny; **nested** paths too (`web/`, `front-end/`). Recursive tree on **every branch**. |
| **Cleaned list (GitHub, 8 Sep 2026)** | See [POLINRIDER-WASH-2026-09-08.md](./POLINRIDER-WASH-2026-09-08.md) | createex **150 clean + 2 empty**; personal **29/29**; Slark-labs **12/12**; sllark **33/33**. Nested PostCSS on `student-hub` + `Event-Karo-Web-App` washed during verify. |
| **Remaining** | `.INFECTED` folders, kit-forensics woff2, `pickle-ball-app` uncommitted tree (**do not pull**), `webmaster-dfc` (no access), leftover **history** in some local clones | Re-infection is possible. Weekly scan. 404 is not forever (`pickle-ball-app` 28 Aug → dirty again before 8 Sep). |

**Cleaning local does not clean GitHub. Cleaning GitHub does not clean someone else’s laptop.** You must do **both** for each repo you own.

---

## Two jobs (do both)

```text
1) LOCAL  — kit gone from the files on disk + gone from that clone’s git history
2) GITHUB — kit gone from github.com/createex/<repo> history, then force-push
```

Until (2) is done, a **new clone** is infected again even if your laptop looks clean.

After a local `filter-branch --all`, `git status` can show `main...origin/main` with **no divergence**. That is a lie: local `refs/remotes/origin/*` were rewritten too. **Do not** `git fetch` / `git pull` from the still-infected GitHub remote into that tree. That brings the trojan back.

---

## Why locate it

The dropper looks like Font Awesome files plus normal VS Code config.

When you **open the folder as a trusted Cursor / VS Code workspace**, a hidden task runs:

```text
node ./public/fonts/fa-solid-400.woff2
```

That “font” is **JavaScript**. It can fetch a second stage, `eval` it, and spawn processes. A later stage on one infected Mac used a LaunchAgent named **`gh-token-monitor`**. **If that agent is present, unload/stop it before revoking GitHub tokens** — revoking first was observed to wipe `$HOME`.

A normal `git add` + delete commit is **not** enough. GitHub still serves the blobs from history, so the next clone is infected again.

---

## Where to locate

### Local (your machine)

Any directory that is a git clone of `https://github.com/createex/<repo>.git`.

Typical places: `~/…/createex/<repo>`, Downloads, old Desktop copies, extra worktrees.

**Do not confuse** a vibe-coding / docs hub folder (only `AGENTS.md` + `.cursor/rules`, **no** `.git` of the app) with the real app clone.

**Example (one Mac, 28 Aug 2026)** — five real clones under `~/mac/createex/`:

| Local folder | GitHub remote | Local after 28 Aug rewrite | GitHub after 8 Sep wash |
|--------------|---------------|----------------------------|--------|
| `LMK-APP` | `createex/LMK-APP` | Kit **gone** (working tree + local history). Payload was **A11** (~27414 bytes) | **Washed.** Do not `git pull` this old tree; re-clone if you need origin to match. |
| `equallyyolk_app` | `createex/equallyyolk_app` | Kit **gone** (A10, ~8943 bytes) | **Washed.** Do not pull. |
| `flagged-app` | `createex/flagged-app` | Kit **gone**. Real `public/.well-known`, `auth`, `index.html` **kept** | **Washed.** Do not pull. Keep `.well-known`. |
| `pickle-ball-app` | `createex/pickle-ball-app` | Kit **gone** (A10) + later uncommitted product | **Washed.** **Do not pull** (uncommitted work). |
| `pizzaratingapp` | `createex/pizzaratingapp` | Kit **gone** (A10) | **Washed.** Do not pull. |

Those five were **not** done after 28 Aug (GitHub still had the kit). As of **8 Sep 2026** GitHub is washed. Still do not pull the old local trees.

**Every other person** must search **their** disk. The other **80** infected GitHub repos were not on this Mac; they still need a GitHub rewrite, and any local clones those people have.

### GitHub (org)

`https://github.com/createex/<repo>` — default branch **and** every other branch/tag.  
Scan date for the lists below: **27 Aug 2026** (contents API on **default branch**). Re-scan before you start. Non-default branches were **not** fully listed.

---

## What to locate (same kit, local or GitHub)

Do **not** execute hits.

### 1. Fake font (the payload)

| Path | What it really is |
|------|-------------------|
| `public/fonts/fa-solid-400.woff2` | **Not a font.** `file` says ASCII text. Leading spaces, then JS: `global.i="A10-*010"` / `A10-*020` or `global.i = 'A11--#'`, `require("http")` / `https` / `zlib` / `child_process.spawn`, `eval`. Sizes seen: **~8943 (A10-*010)**, **~27414 (A11)**, **32874 (A10-*020)**, **~32645 (re-infect)**. |

### 2. Camouflage kit (cover files, still remove)

Same hashes across infected apps. **Not used** by those apps. README lies about a “Blockchain Explorer”.

Under `public/fonts/`:

- `README.md` (“Blockchain Explorer” / `public/index.html`)
- `fa-brands-400.{eot,svg,ttf,woff,woff2}`
- `fa-regular-400.{eot,svg,ttf,woff,woff2}`
- `fa-solid-900.{eot,svg,ttf,woff,woff2}`

`fa-brands-400.woff2` etc. often **are** real `wOF2` bytes. They are still part of the kit. Remove the **whole planted Font Awesome set**, not only the JS file.

**Do not delete real app fonts** or other real `public/` assets (for example `flagged-app` `.well-known`). Only remove `fa-*` + the Blockchain Explorer README.

### 3. Hidden launcher — `.vscode/tasks.json`

- `"label": "eslint-check"`
- `"hide": true`
- `"runOn": "folderOpen"`
- Command runs `node ./public/fonts/fa-solid-400.woff2` (unix + Windows `where node` fallback)

This fires when the folder is **trusted** in Cursor/VS Code.

### 4. Auto-task enabler — `.vscode/settings.json`

- `"task.allowAutomaticTasks": true`
- Nested `"tasks"` with `"runOn": "folderOpen"` and decoy `npm run lint`
- SST / Windows / `jest.unit.config.cjs` / `compile-hero` noise in apps that are not SST

### 5. Other identical planted JSON (same bytes across unrelated repos)

- `.vscode/launch.json` — SST debug, `AWS_PROFILE`: `flo-ct-flo360`
- `.vscode/extensions.json` — plantuml + prettier
- `.vscode/spellright.dict` — `Contentful` / `Lerna`

If these four `.vscode` files are **byte-identical** in a Flutter app and a Nest API, they are the kit. Delete the kit. Do not keep “maybe useful” settings.

### 6. Config-file tails (build-time dropper)

Same family, **different trigger**. Font/tasks 404 is **not** clean.

- Files (any directory, not only repo root): `postcss.config.js`, `postcss.config.mjs`, `babel.config.js`, `tailwind.config.js`, `tailwind.config.cjs`
- Real files: tens to ~1400 bytes, no `global.i=`
- Kit: ~**33009–33249** bytes, marker `global.i="A10-*1909-10"`
- Missed on 8 Sep until recursive scan: `student-hub/front-end/postcss.config.mjs`, `Event-Karo-Web-App/web/postcss.config.mjs`

Strip by truncating at `global.i=` (keep the real config). Then rewrite **history**. A working-tree edit is not enough.

---

## How to locate

### A. Local clone (Terminal — do not open Cursor first)

1. Confirm `git remote -v` is `github.com/createex/<expected-repo>` (not a lookalike).
2. **Do not** open that directory as a trusted Cursor/VS Code workspace yet (`folderOpen` is the launcher).
3. **Do not** `npm install` / `flutter pub get` / `pod install` until the scan is clean.
4. Run from the clone root:

```bash
find . -name 'fa-solid-400.woff2' -not -path '*/.git/*' -not -path '*/node_modules/*'
find . -path '*/public/fonts/fa-*' -not -path '*/.git/*'
find . -path '*/.vscode/tasks.json' -not -path '*/.git/*'

grep -R -n -E 'folderOpen|allowAutomaticTasks|fa-solid-400\.woff2|eslint-check|A10-\*010|A10-\*020|A10-\*1909-10|A11--#' \
  --include='*.json' --include='*.woff2' --include='README.md' \
  --exclude-dir=.git --exclude-dir=node_modules .
```

Classify a `.woff2`:

```bash
file public/fonts/fa-solid-400.woff2
python3 -c "p='public/fonts/fa-solid-400.woff2'; b=open(p,'rb').read(80); print(repr(b[:40])); print('woff2_magic', b[:4]==b'wOF2')"
```

- Magic `wOF2` = real font (may still be camouflage `fa-brands` / `fa-solid-900`).
- ASCII / spaces then `require(` / `eval` = **malware**. Do not run it.

Also check history (files may already be deleted but still in git):

```bash
git log --all --oneline -- public/fonts
git log --all --oneline -- .vscode
```

Non-zero = still in **local** history even if the working tree looks clean.

Find other clones on your Mac:

```bash
# example — adjust the start path
find "$HOME" -name .git -type d 2>/dev/null | while read g; do
  git -C "${g%/.git}" remote -v 2>/dev/null
done | grep -i createex
```

### B. GitHub (no trusted clone)

```bash
# 404 = not on default branch (still check other branches)
gh api repos/createex/YOUR-REPO/contents/public/fonts/fa-solid-400.woff2
gh api repos/createex/YOUR-REPO/contents/.vscode/tasks.json
gh api repos/createex/YOUR-REPO/contents/.vscode/settings.json
gh api repos/createex/YOUR-REPO/contents/public/fonts/README.md
# nested configs (root-only check missed these)
gh api repos/OWNER/REPO/contents/postcss.config.js
gh api repos/OWNER/REPO/contents/front-end/postcss.config.mjs
gh api repos/OWNER/REPO/contents/web/postcss.config.mjs
```

List branches, then check a non-default ref:

```bash
gh api repos/createex/YOUR-REPO/branches --jq '.[].name'
gh api "repos/createex/YOUR-REPO/contents/.vscode/tasks.json?ref=BRANCH"
```

If you must clone: `git clone --mirror` or clone in Terminal **only**. Do **not** open that folder in Cursor until the scan is clean.

### C. LaunchAgent (before any token revoke)

```bash
ls ~/Library/LaunchAgents
launchctl list | grep -i -E 'gh-token|token-monitor' || true
```

If `gh-token-monitor` exists: **unload/stop it first**, then rotate tokens.

---

## What to remove / why

| Remove | Why |
|--------|-----|
| `public/fonts/fa-solid-400.woff2` | Actual JS payload |
| Rest of planted `public/fonts/fa-*` + Blockchain README | Camouflage; same kit in every infected app |
| Entire planted `.vscode/` kit (`tasks.json`, `settings.json`, `launch.json`, `extensions.json`, `spellright.dict`) | Launcher + auto-run + copy-pasted decoy JSON |
| **Git history** of those paths on **every local branch** | Otherwise your clone still has the blobs; a later checkout brings them back |
| **Git history** on **GitHub every branch/tag** | Otherwise every new clone from Createex is infected |

**Leave:** real product fonts, real `.well-known` / auth HTML, real logos (`flagged-app` keeps those).

---

## How to remove — LOCAL (clone already on disk)

Do this in **Terminal**. Do **not** open the folder in Cursor until the scan is clean again.

Optional: copy the kit elsewhere for forensics. **Never** `node` those copies.

```bash
cd /path/to/YOUR-CLONE

# working tree — kit only (flagged-app: do not rm all of public/)
# if public/fonts is ONLY the Font Awesome kit:
rm -rf public/fonts
rm -rf .vscode

export FILTER_BRANCH_SQUELCH_WARNING=1
git filter-branch -f --index-filter \
  'git rm -r --cached --ignore-unmatch -- public/fonts .vscode' \
  --prune-empty --tag-name-filter cat -- --all

rm -rf .git/refs/original
git reflog expire --expire=now --all
git gc --prune=now

# must both print 0
git log --all --oneline -- public/fonts | wc -l
git log --all --oneline -- .vscode | wc -l
```

If the app has **legitimate** files under `public/fonts/` (not `fa-*`), do **not** wipe all of `public/fonts`. Use the path-list filter in the GitHub section below.

**Stop.** Local history is clean. GitHub is **not**. Do **not** `git pull` / `git fetch`. Do **not** `git push` until you intend to force-push the rewritten history (next section), or until someone else has already force-pushed a rewritten remote and you **re-clone**.

---

## How to remove — GITHUB (org copy)

Need **admin / force-push** on that repo. One repo at a time. Prefer a **bare mirror** so Cursor cannot `folderOpen`.

### A. Mirror + rewrite

```bash
# Do not open this folder in Cursor
git clone --mirror https://github.com/createex/YOUR-REPO.git YOUR-REPO.git
cd YOUR-REPO.git

export FILTER_BRANCH_SQUELCH_WARNING=1
git filter-branch -f --index-filter \
  'git rm -r --cached --ignore-unmatch -- public/fonts .vscode' \
  --prune-empty --tag-name-filter cat -- --all

rm -rf refs/original
git reflog expire --expire=now --all
git gc --prune=now

# Must be 0
git log --all --oneline -- public/fonts | wc -l
git log --all --oneline -- .vscode | wc -l
```

If the app has **legitimate** files under `public/fonts/` (not `fa-*`), **do not** wipe all of `public/fonts`. Remove only kit paths:

```bash
git filter-branch -f --index-filter \
  'git rm -r --cached --ignore-unmatch -- \
    public/fonts/fa-solid-400.woff2 \
    public/fonts/README.md \
    public/fonts/fa-brands-400.eot public/fonts/fa-brands-400.svg \
    public/fonts/fa-brands-400.ttf public/fonts/fa-brands-400.woff \
    public/fonts/fa-brands-400.woff2 \
    public/fonts/fa-regular-400.eot public/fonts/fa-regular-400.svg \
    public/fonts/fa-regular-400.ttf public/fonts/fa-regular-400.woff \
    public/fonts/fa-regular-400.woff2 \
    public/fonts/fa-solid-900.eot public/fonts/fa-solid-900.svg \
    public/fonts/fa-solid-900.ttf public/fonts/fa-solid-900.woff \
    public/fonts/fa-solid-900.woff2 \
    .vscode' \
  --prune-empty --tag-name-filter cat -- --all
```

`flagged-app`: keep real `public/.well-known`, `auth`, `index.html`.

### A2. Config tails (PostCSS / Babel / Tailwind)

Font-only index-filter **misses** ~33 KB `global.i=` tails. Use a tree-filter that **truncates** those files (helper: `slark/dfc/_tmp_strip_dropper.py` or equivalent: walk the tree, if filename matches and bytes contain `global.i=`, keep only the prefix). Also `rm -rf public/fonts .vscode` in that filter.

**Do not** run `git rm --cached` inside the tree-filter — that missed leftover fonts on old branches (`wrytify-frontend`).

```bash
git filter-branch -f --tree-filter \
  "python3 /path/to/strip_dropper.py; rm -rf public/fonts .vscode" \
  --prune-empty --tag-name-filter cat -- --all
```

Then prune `refs/original`, reflog expire, `gc`, unset mirror, force-push heads/tags only (section B).

### B. Force-push **branches and tags only** (not `refs/pull/*`)

GitHub rejects pushing pull-request refs. `git push --mirror --force` fails on those.

```bash
git config --unset-all remote.origin.mirror || true
git config remote.origin.mirror false
git push --force origin 'refs/heads/*:refs/heads/*'
git show-ref --tags >/dev/null && git push --force origin 'refs/tags/*:refs/tags/*' || true
```

### C. Verify on GitHub

```bash
gh api repos/createex/YOUR-REPO/contents/.vscode/tasks.json
# expect 404
gh api repos/createex/YOUR-REPO/contents/public/fonts/fa-solid-400.woff2
# expect 404
```

Repeat for other branches if the repo has them. Also confirm leftover `postcss`/`babel`/`tailwind` files are tiny and contain no `global.i=` — including under `web/` and `front-end/`.

### D. After force-push

- Do **not** `git pull` an old infected `origin` into a mixed local copy.
- **Re-clone**, or `git fetch` + reset only **after** GitHub is rewritten.
- Scan the new clone in Terminal before opening as a trusted workspace.
- Then rotate GitHub tokens / org secrets (after confirming no `gh-token-monitor`).

---

## Lists — Createex only

Similar names (do not mix them up):

| Infected (clean this) | Clean on default branch (still scan clones) |
|----------------------|-----------------------------------------------|
| `cooklkeme` | `cooklikeme` |
| `chat_prism_app` | `Chat-Prism-Dashboad` |
| `lgbtq` | `LGBTQ-Website` |
| `pickle-ball-app`, `pickleball-backend` | `PickleBall-Dashboard` |

**Re-scan 2026-09-07 (pre-wash):** `pickleball-backend` `main` had the **full kit** (`A10-*020` 32874 B). `pickle-ball-app` `main` had the kit **again** after the 2026-08-28 rewrite. `PickleBall-Dashboard` font/tasks 404 but PostCSS ~33009 B (`A10-*1909-10`).

**Wash + verify 2026-09-08:** those three GitHub remotes were rewritten. Recursive re-scan of createex = **0 kit** on branch tips. Local `pickle-ball-app` still **must not `git pull`** (uncommitted product). Dashboard: use the **fresh** clone, not `.INFECTED`.

### 1. Local — cleaned on one Mac (28 Aug 2026)

Working tree + **local** git history rewritten that day. GitHub was still infected until **8 Sep 2026**. Do not `git pull` those old trees; re-clone if you need origin to match.

- `LMK-APP`
- `equallyyolk_app`
- `flagged-app`
- `pickle-ball-app`
- `pizzaratingapp`

### 2. Local — remaining

On **that** Mac: no kit files left in those five trees; local history of `public/fonts` and `.vscode` is empty.

**On your Mac:** remaining = any Createex clone that still fails the local scan, **or** a rewritten clone you later `git pull` from GitHub before force-push. Scan every clone you have. This playbook cannot see other people’s disks.

### 3. GitHub — remotes fully cleaned (force-pushed)

**8 Sep 2026** from `macbuilds-dev`: createex (88 font-kit + 41 config-dropper, including `fox-training-dashboard` retry), plus personal / Slark-labs / sllark as listed in [POLINRIDER-WASH-2026-09-08.md](./POLINRIDER-WASH-2026-09-08.md). Config wash uses **tree-filter strip**, not `git rm --cached` inside the tree-filter.

`webmaster-dfc` was **not** washed (this login gets 404).

### 4. GitHub — names that **were** infected (historical, 27 Aug 2026 default-branch scan)

Treat the names below as **what the kit looked like**, not as still-dirty. Re-scan before you assume a new clone is clean. Also scan **non-default branches** and **nested configs**.

All names: `github.com/createex/<name>`.

#### Partial (planted `.vscode` only — still remove + rewrite history)

- `french-driving-theory-app` — `tasks.json` + `settings.json` (no font at that path on default branch)
- `lgbtq` — `settings.json` only
- `healthbouk` — `settings.json` only
- `chatfil-mobile` — `settings.json` only

#### Full kit (default branch) — 81 repos

- `pickle-ball-app` — kit **back on GitHub `main` 2026-09-07** after 28 Aug rewrite
- `pickleball-backend` — **full kit on `main` 2026-09-07** (was listed clean on 27 Aug)
- `Cleaning-App`
- `flagged-app`
- `cooklkeme`
- `pizzaratingapp`
- `mirathiapp`
- `equallyyolk_app`
- `deyari_app`
- `createex-backend-data`
- `boatparts-app`
- `bell_master`
- `alwaton_cool_app`
- `learning_app`
- `LeanOnMe`
- `knock`
- `Investigation`
- `inprop`
- `inno_hub`
- `iArab-App`
- `HouseToMotive-Updated-last-`
- `HouseToMotive`
- `food_fusion_app`
- `elite-app`
- `comnow`
- `chat_prism_app`
- `BoliApp`
- `au_book_app`
- `AdsManager`
- `Zippex-App`
- `zippex`
- `yoopii_backend`
- `yoopii-app-new`
- `wave_app`
- `wave`
- `voyager_radio_app`
- `Villemara-App`
- `vibeturn`
- `velllmira_updated_app`
- `Tyed`
- `todo_pro_app`
- `todo_app`
- `tekker5`
- `TechnicianSeller`
- `TechnicianCustomer`
- `t_world_app`
- `Spotter`
- `social-e-commerce-app`
- `SmartGuard`
- `seasonal_food_app`
- `retreat_app`
- `QuizApp`
- `qc_quida_app`
- `New-qaidah-App`
- `my-journal`
- `MeccaApp`
- `LMK-APP`
- `listing-backend`
- `king_manor_app`
- `inno-hub-public`
- `Influencer-App`
- `GsTaxiDriver`
- `GsTaxiCustomer`
- `grc_app`
- `Fx-Trader`
- `fungi_app`
- `fox_training_tab_app`
- `fox_training_new`
- `fox_training_app`
- `Fox_Training`
- `food_fusion_backend`
- `Facebook`
- `eco_guardian`
- `eco-guardian-app`
- `driver_net`
- `dividr-backend`
- `currency-trader`
- `CrimeScene`
- `Createex_Website`
- `cooking_app`
- `circleApp`
- `aura-perfume-app`

### 5. GitHub — scanned **clean** on default branch (27 Aug 2026)

Still scan after clone. Other branches were not fully enumerated. **Not** the same as “history rewritten.”

- `driving-app-admin`
- `pickleball-backend` — **no longer clean; full kit on `main` as of 2026-09-07**
- `PickleBall-Dashboard`
- `LGBTQ-Website`
- `fox-training-dashboard`
- `cooklikeme`
- `Chat-Prism-Dashboad`
- `browser-game`
- `journal-app-backend`
- `iq-dashboard`
- `investment-backend`
- `iArab-Dashboard`
- `fox-training-backend-old`
- `fox-training-backend`
- `Eu-Affair-website`
- `Eu-affair-Admin`
- `Createex-New-Website`
- `Braelo_Dashboard`
- `Astrology_Website`
- `Zippex-Dashboard`
- `Yoopii-Dashboard`
- `villemara-backend`
- `Vilemara`
- `Token_Website_FrontEnd`
- `token`
- `todo_app_backend`
- `Todo-Admin-Dashboard`
- `t_world_backend`
- `Sleek-Website`
- `sleek-backend`
- `Seilbahnen-Website`
- `quiz-app`
- `pos_backend`
- `Pos-Dashboard`
- `MyJournalDashbord`
- `mustang-gates`
- `lmk_backend`
- `listing-app-admin`
- `learning-app-dashboard`
- `learning-app`
- `Knock-Bakend`
- `kingmanor-admin`
- `IqWebsite`
- `Iq-backend`
- `investLlearning-dashboard`
- `invest-learning`
- `House-to-Motive-Dashboared`
- `gsTaxi_AdminPanel`
- `EU-Affair`
- `Dividr-Dashboard`
- `Createex-Website-New`
- `Counter_Website_Admin`
- `counter_website`
- `Community_website`
- `Circle_App_Dashboard`
- `circle`
- `children_backend`
- `Boli_Dashboard`
- `boli`
- `Bilquees`
- `balck-water`
- `backend-starter-template`
- `AUBook-Website`
- `alwaton-cool-backend`
- `AU-Book-Web`
- `bookApp_backend`
- `InscriptionCustomer`

---

## After both jobs

A repo is **done** only when:

1. Local scan is clean **and** `git log --all` for kit paths is 0, **and**
2. GitHub `gh api` for kit paths is **404** on default branch **and** other branches you use, **and**
3. You did **not** pull the old infected remote back into a rewritten clone.

Treat every **new** GitHub clone as untrusted until the local scan is clean.
