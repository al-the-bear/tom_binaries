#!/bin/bash
# Pull and prepare darwin-x64 executables
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Pulling latest binaries..."
git pull

echo "Making darwin-x64 binaries executable..."
chmod +x darwin-x64/* 2>/dev/null || true
chmod +x tom/darwin-x64/* 2>/dev/null || true

echo "Done. darwin-x64 executables are ready."
