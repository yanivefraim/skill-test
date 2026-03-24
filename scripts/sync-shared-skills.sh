#!/bin/bash
# Replaces skill symlinks with real copies of the target files.
# Run this before distributing or when developing on Windows.
#
# Usage: ./scripts/sync-shared-skills.sh

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

find "$REPO_ROOT/plugins" -type l -name "*.md" -o -type l | while read -r link; do
  target="$(readlink "$link")"
  # Resolve relative target from the link's directory
  resolved="$(cd "$(dirname "$link")" && cd "$(dirname "$target")" && pwd)/$(basename "$target")"

  if [ -e "$resolved" ]; then
    rm "$link"
    cp -r "$resolved" "$link"
    echo "Copied: $(basename "$(dirname "$link")")/$(basename "$link")"
  else
    echo "Warning: broken symlink $link -> $target"
  fi
done

echo "Done. All symlinks replaced with copies."
