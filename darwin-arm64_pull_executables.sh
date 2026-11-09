#!/bin/bash
# Pull and prepare darwin-arm64 executables
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Pulling latest binaries..."
git pull

echo "Making darwin-arm64 binaries executable..."
chmod +x darwin-arm64/* 2>/dev/null || true
chmod +x tom/darwin-arm64/* 2>/dev/null || true

echo "Done. darwin-arm64 executables are ready."
