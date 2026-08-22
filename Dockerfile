FROM python:3.11-slim

LABEL org.opencontainers.image.title="Axolotl"
LABEL org.opencontainers.image.description="Axolotl - Red-DiscordBot Fork"
LABEL org.opencontainers.image.source="https://github.com/OverClxckedStudios/Axolotl"

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /app

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    ffmpeg \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the repository
COPY . /app

# Upgrade packaging tools
RUN python -m pip install --upgrade pip setuptools wheel

# Install Axolotl
RUN if [ -f requirements.txt ]; then \
        pip install -r requirements.txt; \
    fi

# Install the fork itself if it has a pyproject/setup.py
RUN if [ -f pyproject.toml ] || [ -f setup.py ]; then \
        pip install .; \
    fi

# Persistent Red/Axolotl data
RUN mkdir -p /data

VOLUME ["/data"]

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
