#!/bin/sh

set -e

echo "=========================================="
echo "          AXOLOTL DISCORD BOT"
echo "=========================================="
echo ""

DATA_DIR="/data"

mkdir -p "$DATA_DIR"

echo "[Axolotl] Starting..."
echo "[Axolotl] Data directory: $DATA_DIR"

# If no Red/Axolotl configuration exists, run the setup wizard.
if [ ! -f "$DATA_DIR/config.json" ]; then
    echo "[Axolotl] No configuration found."
    echo "[Axolotl] Running initial setup..."

    redbot-setup --no-prompt "$DATA_DIR"
fi

echo "[Axolotl] Starting bot..."

exec redbot --no-prompt "$DATA_DIR"
