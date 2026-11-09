#!/bin/bash
# Pull and prepare linux-armhf executables
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Pulling latest binaries..."
git pull

echo "Making linux-armhf binaries executable..."
chmod +x linux-armhf/* 2>/dev/null || true
chmod +x tom/linux-armhf/* 2>/dev/null || true

echo "Done. linux-armhf executables are ready."
