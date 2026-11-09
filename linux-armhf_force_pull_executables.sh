#!/bin/bash
# Force pull linux-armhf executables (overwrites local changes)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Fetching latest from remote..."
git fetch origin

echo "Resetting to remote main (local changes will be overwritten)..."
git reset --hard origin/main

echo "Making linux-armhf binaries executable..."
chmod +x linux-armhf/* 2>/dev/null || true
chmod +x tom/linux-armhf/* 2>/dev/null || true

echo "Done. linux-armhf executables are ready."
