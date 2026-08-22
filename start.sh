#!/bin/sh

set -e

echo "=========================================="
echo "              AXOLOTL"
echo "        Red-DiscordBot Fork"
echo "=========================================="

DATA_DIR="/data"
INSTANCE_NAME="axolotl"

mkdir -p "$DATA_DIR"

echo "[Axolotl] Data directory: $DATA_DIR"

if [ -z "$TOKEN" ]; then
    echo "[Axolotl] ERROR: TOKEN environment variable is not set."
    exit 1
fi

if [ -z "$OWNER_ID" ]; then
    echo "[Axolotl] ERROR: OWNER_ID environment variable is not set."
    exit 1
fi

if [ -z "$PREFIX" ]; then
    PREFIX="!"
fi

echo "[Axolotl] Prefix: $PREFIX"
echo "[Axolotl] Owner: $OWNER_ID"

# Create the instance on first boot
if [ ! -d "$DATA_DIR/$INSTANCE_NAME" ]; then
    echo "[Axolotl] Creating new instance..."

    redbot-setup --no-prompt \
        --instance-name "$INSTANCE_NAME" \
        --data-path "$DATA_DIR/$INSTANCE_NAME" \
        --backend json
fi

echo "[Axolotl] Starting bot..."

exec redbot "$INSTANCE_NAME"
