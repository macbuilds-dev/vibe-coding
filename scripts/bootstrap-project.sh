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
copy_if_missing ".cursor/rules/00-memory-workflow.mdc"
copy_if_missing ".cursor/rules/01-commit-push.mdc"
copy_if_missing ".cursor/rules/02-acp2gh.mdc"

echo "Done. Fill AGENTS.md and docs/ai/*.md with project-specific facts."
