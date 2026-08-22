#!/bin/bash

INSTANCE_PATH="/data/Axolotl"

# Check if the instance has already been set up on the volume
if [ ! -d "$INSTANCE_PATH" ]; then
    echo "Instance not found. Running initial automated setup..."
    redbot-setup --name Axolotl \
                 --path /data \
                 --owner "$OWNER_ID" \
                 --token "$TOKEN" \
                 --prefix "${PREFIX:-!}" \
                 --no-prompt
fi

echo "Starting Red-DiscordBot..."
exec redbot Axolotl --token "$TOKEN"
