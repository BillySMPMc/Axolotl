#!/bin/bash

# Force Red to store its global config/registry on the persistent volume
export XDG_CONFIG_HOME="/data"

INSTANCE_DIR="/data/Red-DiscordBot"
CONFIG_FILE="/data/Red-DiscordBot/config.json"

# If the config registry doesn't exist, generate it automatically
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Creating Red-DiscordBot configuration registry..."
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

echo "Starting Red-DiscordBot for Axolotl..."
exec redbot Axolotl --token "$TOKEN" --owner "$OWNER_ID" --prefix "${PREFIX:-!}"
