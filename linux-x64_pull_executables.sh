#!/bin/bash
# Pull and prepare linux-x64 executables
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Pulling latest binaries..."
git pull

echo "Making linux-x64 binaries executable..."
chmod +x linux-x64/* 2>/dev/null || true
chmod +x tom/linux-x64/* 2>/dev/null || true

echo "Done. linux-x64 executables are ready."
