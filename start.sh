#!/bin/sh

set -e

echo "=========================================="
echo "              AXOLOTL"
echo "        Red-DiscordBot Fork"
echo "=========================================="

DATA_DIR="/data"

mkdir -p "$DATA_DIR"

echo "[Axolotl] Starting..."
echo "[Axolotl] Data directory: $DATA_DIR"

if [ -z "$TOKEN" ]; then
    echo "[Axolotl] ERROR: TOKEN environment variable is not set."
    exit 1
fi

if [ -z "$PREFIX" ]; then
    PREFIX="!"
fi

echo "[Axolotl] Prefix: $PREFIX"

exec redbot "$DATA_DIR"
