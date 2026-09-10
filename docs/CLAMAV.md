# ClamAV on this Mac — how to run it

Extra host scan. **Not a cure for PolinRider.** The kit is fake-font JS + VS Code `folderOpen` + ~33 KB config tails in **git**. ClamAV signatures did **not** flag the known forensics `fa-solid-400.woff2` on 8 Sep 2026.

Always do the Terminal IOC scan first: [POLINRIDER-WASH-2026-09-08.md](./POLINRIDER-WASH-2026-09-08.md) and `.cursor/rules/00-woff2-folderopen-dropper.mdc`.

This Mac (8 Sep 2026): Homebrew **ClamAV 1.5.4**, Intel prefix **`/usr/local`**. Apple Silicon would use `/opt/homebrew` instead — same steps, different paths.

Do **not** copy this file into company trees.

---

## 1. Install (once)

```bash
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
brew install clamav
```

Finish config (Homebrew ships **samples only** until you do this):

```bash
# Intel Homebrew
CONF=/usr/local/etc/clamav
# Apple Silicon: CONF=/opt/homebrew/etc/clamav

sed 's/^Example/# Example/' "$CONF/freshclam.conf.sample" > "$CONF/freshclam.conf"
sed 's/^Example/# Example/' "$CONF/clamd.conf.sample" > "$CONF/clamd.conf"
```

You do **not** need `sudo brew services start clamav` for on-demand scans. That starts `clamd` at login and needs sudo. Use `clamscan` below unless you want a daemon.

---

## 2. Update signatures (before every real scan)

```bash
freshclam
```

First run downloads `daily.cvd`, `main.cvd`, `bytecode.cvd` (several minutes). Harmless `ERROR: NULL X509 store` lines showed up on this Mac; the databases still installed.

Check:

```bash
clamscan --version
ls /usr/local/var/lib/clamav/*.cvd
# Apple Silicon: /opt/homebrew/var/lib/clamav/
```

---

## 3. Scan a clone (after IOC grep, before Cursor)

From the clone root. Do **not** `node` any `*.woff2`.

```bash
clamscan -r --infected \
  --exclude-dir='node_modules' \
  --exclude-dir='\.git' \
  --exclude-dir='\.dart_tool' \
  --exclude-dir='Pods' \
  .
```

- `--infected` prints only hits (plus a summary).
- Exit **1** = infected files found. Stop. Do not install. Report paths.
- Exit **0** = ClamAV found nothing. **Still required:** woff2 / `.vscode` / nested `global.i=` scan. 0 hits is **not** a PolinRider clean bill.

---

## 4. Scan this machine (weekly / after a scare)

What we ran 8 Sep (0 ClamAV hits):

```bash
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
freshclam

# known kit copy — expect ClamAV to miss it; never node it
clamscan --infected /Users/mac/mac/createex/_quarantine/pickleball-backend-kit-forensics

clamscan --infected -r "$HOME/Library/LaunchAgents"

clamscan --infected -r \
  --exclude-dir='node_modules' \
  --exclude-dir='\.dart_tool' \
  --exclude-dir='Pods' \
  --exclude-dir='/\.git/' \
  --exclude-dir='_wash-mirrors' \
  --exclude-dir='/build/' \
  --exclude-dir='DerivedData' \
  /Users/mac/mac

clamscan --infected -r --exclude-dir='node_modules' "$HOME/Downloads"
clamscan --infected -r --exclude-dir='node_modules' "$HOME/Desktop"
```

8 Sep result: **Infected files: 0** on `~/mac` (4957 files), Downloads (1801), Desktop, LaunchAgents. Forensics woff2: **not flagged**.

Optional log:

```bash
clamscan -r --infected /Users/mac/mac 2>&1 | tee "$HOME/mac/_clamav-scan.log"
```

Do not commit that log into a product repo.

---

## 5. What ClamAV is for / not for

| Use it for | Do not use it instead of |
|------------|---------------------------|
| Generic Windows/Linux malware that landed as a binary | Fake `fa-solid-400.woff2` (JS) |
| Random downloads on Desktop/Downloads | Planted `.vscode/tasks.json` `folderOpen` |
| Extra pass after a clone IOC scan | ~33 KB PostCSS/Babel/Tailwind `global.i=` tails |
| Peace of mind on LaunchAgents | Git history rewrite / force-push / re-clone |

If `clamscan` prints `FOUND`, treat it as real until proven otherwise: isolate the file, do not execute, do not `node` it.

If you see LaunchAgent **`gh-token-monitor`**: unload it **before** revoking GitHub tokens. ClamAV not finding it does not mean it is absent — still `ls ~/Library/LaunchAgents` and `launchctl list`.

---

## 6. Fresh-clone ritual (order)

1. `git clone` in Terminal. Do **not** open in Cursor yet.
2. IOC grep (woff2, `folderOpen`, nested configs) — [POLINRIDER-WASH-2026-09-08.md](./POLINRIDER-WASH-2026-09-08.md).
3. `freshclam` (if the DB is stale) then `clamscan` as in section 3.
4. Only then: open Cursor, `npm` / `pub` / `pod`.

Keep Cursor `"task.allowAutomaticTasks": "off"`.
