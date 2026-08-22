FROM python:3.11-slim

# Install system dependencies required for some cogs/audio
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libffi-dev \
    libssl-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install the bot
COPY . /app
RUN pip install --no-cache-dir .

# Create the data directory for persistent storage
RUN mkdir -p /data

# Default command to run Red-DiscordBot
CMD ["redbot", "Axolotl", "--no-color", "--instance-path", "/data"]
