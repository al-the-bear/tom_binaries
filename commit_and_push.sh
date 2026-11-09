#!/bin/bash
# Commit all binary changes and push to remote
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check for changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "No changes to commit."
  exit 0
fi

echo "Staging all changes..."
git add -A

echo ""
echo "Changes to be committed:"
git diff --cached --stat
echo ""

# Build commit message from changed platforms
PLATFORMS=""
for dir in darwin-arm64 darwin-x64 linux-x64 linux-arm64 linux-armhf win32-x64; do
  if git diff --cached --name-only | grep -q "$dir/"; then
    PLATFORMS="${PLATFORMS} ${dir}"
  fi
done

TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
MSG="Update binaries ${TIMESTAMP}${PLATFORMS:+ (${PLATFORMS## })}"

echo "Committing: $MSG"
git commit -m "$MSG"

echo ""
echo "Pushing to remote..."
git push origin main

echo ""
echo "Done. All binary changes committed and pushed."
