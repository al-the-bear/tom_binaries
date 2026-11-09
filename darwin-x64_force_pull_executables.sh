#!/bin/bash
# Force pull darwin-x64 executables (overwrites local changes)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Fetching latest from remote..."
git fetch origin

echo "Resetting to remote main (local changes will be overwritten)..."
git reset --hard origin/main

echo "Making darwin-x64 binaries executable..."
chmod +x darwin-x64/* 2>/dev/null || true
chmod +x tom/darwin-x64/* 2>/dev/null || true

echo "Done. darwin-x64 executables are ready."
