#!/bin/sh

set -e

echo "=========================================="
echo "              AXOLOTL"
echo "        Red-DiscordBot Fork"
echo "=========================================="

DATA_DIR="/data"

mkdir -p "$DATA_DIR"

echo "[Axolotl] Data directory: $DATA_DIR"

if [ -z "$TOKEN" ]; then
    echo "[Axolotl] ERROR: TOKEN environment variable is not set."
    exit 1
fi

if [ -z "$PREFIX" ]; then
    PREFIX="!"
fi

echo "[Axolotl] Starting Axolotl..."

# Existing Red configuration
if [ -f "$DATA_DIR/config.json" ]; then
    echo "[Axolotl] Existing configuration found."
    exec redbot "$DATA_DIR"
fi

echo "[Axolotl] No configuration found."
echo "[Axolotl] Creating initial bot configuration..."

redbot "$DATA_DIR" --no-prompt
