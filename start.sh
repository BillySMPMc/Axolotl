#!/bin/bash

CONFIG_DIR="/data/.config/Red-DiscordBot"
INSTANCE_DIR="/data/Axolotl"

# Check if the instance config already exists
if [ ! -f "$CONFIG_DIR/config.json" ]; then
    echo "Generating Red configuration files..."
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$INSTANCE_DIR"

    # Write a basic configuration json so redbot knows about the Axolotl instance
    cat << EOF > "$CONFIG_DIR/config.json"
{
    "Axolotl": {
        "DATA_PATH": "$INSTANCE_DIR",
        "STORAGE_TYPE": "JSON",
        "STORAGE_DETAILS": {}
    }
}
EOF
fi

echo "Starting Red-DiscordBot for Axolotl..."
exec redbot Axolotl --token "$TOKEN" --prefix "${PREFIX:-!}"
