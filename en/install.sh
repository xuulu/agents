#!/usr/bin/env bash
#
# AI Agent Project Kit — installer (English version)
#
# Usage:
#   ./install.sh [target-directory]
#
# Copies AGENTS.md and the .ai/ memory templates from THIS folder into the
# root of a target repository (default: current directory).
#
# The installer never overwrites existing files: if a destination file
# already exists, it is left untouched and a warning is printed.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$(pwd)}"

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "Error: target directory does not exist: $TARGET_DIR" >&2
  exit 1
fi

# --- AGENTS.md ---------------------------------------------------------------
if [[ -e "$TARGET_DIR/AGENTS.md" ]]; then
  echo "Skip:  $TARGET_DIR/AGENTS.md already exists (left untouched)"
else
  cp "$SCRIPT_DIR/AGENTS.md" "$TARGET_DIR/AGENTS.md"
  echo "Installed: $TARGET_DIR/AGENTS.md"
fi

# --- .ai/ memory templates ---------------------------------------------------
if [[ -d "$TARGET_DIR/.ai" ]]; then
  echo "Note:  $TARGET_DIR/.ai already exists; copying only missing templates"
else
  mkdir -p "$TARGET_DIR/.ai"
  echo "Created: $TARGET_DIR/.ai/"
fi

for f in PROJECT.md ARCHITECTURE.md DECISIONS.md TROUBLESHOOTING.md; do
  if [[ -e "$TARGET_DIR/.ai/$f" ]]; then
    echo "Skip:  $TARGET_DIR/.ai/$f already exists (left untouched)"
  else
    cp "$SCRIPT_DIR/.ai/$f" "$TARGET_DIR/.ai/$f"
    echo "Installed: $TARGET_DIR/.ai/$f"
  fi
done

echo
echo "Done. AGENTS.md is the agent entry point."
echo "Fill in .ai/ templates gradually with confirmed, non-obvious knowledge."
