#!/bin/bash

# Force Red-DiscordBot configuration registry directory to your persistent volume
export XDG_CONFIG_HOME="/data"

CONFIG_DIR="/data/Red-DiscordBot"
INSTANCE_DIR="/data/Axolotl"
CONFIG_FILE="$CONFIG_DIR/config.json"

# Create directories and instance JSON configuration file if they don't exist
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Initializing Red-DiscordBot configuration for Axolotl..."
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$INSTANCE_DIR"

    cat << EOF > "$CONFIG_FILE"
{
    "Axolotl": {
        "DATA_PATH": "$INSTANCE_DIR",
        "STORAGE_TYPE": "JSON",
        "STORAGE_DETAILS": {}
    }
}
EOF
fi

echo "Starting Red-DiscordBot instance: Axolotl..."
exec redbot Axolotl --token "$TOKEN" --owner "$OWNER_ID" --prefix "${PREFIX:-!}"
