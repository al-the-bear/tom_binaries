#!/bin/bash
# Pull and prepare linux-arm64 executables
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Pulling latest binaries..."
git pull

echo "Making linux-arm64 binaries executable..."
chmod +x linux-arm64/* 2>/dev/null || true
chmod +x tom/linux-arm64/* 2>/dev/null || true

echo "Done. linux-arm64 executables are ready."
