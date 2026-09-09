#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
SRC="$(cd "$(dirname "$0")/.." && pwd)/templates"
DEST="$(cd "$TARGET" && pwd)"

echo "Bootstrapping vibe-coding templates into: $DEST"
mkdir -p "$DEST/docs/ai" "$DEST/.cursor/rules"

copy_if_missing() {
  local rel="$1"
  if [[ -e "$DEST/$rel" ]]; then
    echo "skip (exists): $rel"
  else
    cp "$SRC/$rel" "$DEST/$rel"
    echo "created: $rel"
  fi
}

copy_if_missing "AGENTS.md"
for f in product architecture decisions active progress lessons; do
  copy_if_missing "docs/ai/$f.md"
done
copy_if_missing ".cursor/rules/00-clone-malware-scan.mdc"
copy_if_missing ".cursor/rules/00-woff2-folderopen-dropper.mdc"
copy_if_missing ".cursor/rules/00-memory-workflow.mdc"
copy_if_missing ".cursor/rules/01-commit-push.mdc"
copy_if_missing ".cursor/rules/02-acp2gh.mdc"
copy_if_missing ".cursor/rules/03-git-identity-macbuilds-dev.mdc"
copy_if_missing ".cursor/rules/03-git-identity-webmaster-dfc.mdc"

# Createex org only — daily Form, Slack Task Monitor, Team Monitor
if [[ "$DEST" == *"/createex/"* ]] || [[ "$DEST" == *"/projects/createex/"* ]]; then
  echo "Createex target: adding company ops rule"
  CX_RULE="/Users/mac/mac/ai/projects/createex/.cursor/rules/04-createex-work-ops.mdc"
  CX_DOC="/Users/mac/mac/ai/projects/createex/CREATEEX-WORK-OPS.md"
  if [[ -f "$CX_RULE" ]]; then
    mkdir -p "$DEST/.cursor/rules"
    if [[ ! -e "$DEST/.cursor/rules/04-createex-work-ops.mdc" ]]; then
      cp "$CX_RULE" "$DEST/.cursor/rules/04-createex-work-ops.mdc"
      echo "created: .cursor/rules/04-createex-work-ops.mdc"
    else
      echo "skip (exists): .cursor/rules/04-createex-work-ops.mdc"
    fi
  fi
  if [[ -f "$CX_DOC" && "$DEST" == *"/ai/projects/createex/"* && ! -e "$DEST/CREATEEX-WORK-OPS.md" ]]; then
    # Only at the createex org hub root, not inside an app folder
    true
  fi
  echo "Createex + Vercel Hobby: keep Git disconnected; commits stay macbuilds-dev."
  echo "CLI deploy must hide .git (see Cleaning-App scripts/vercel-prod.sh). Do not commit as createexapple."
  echo "Createex Slack: channel /taskbot plus easy @Ali status in the same task thread (client-forwardable). Never slash-only."
fi

echo "Done. Fill AGENTS.md and docs/ai/*.md with project-specific facts."
