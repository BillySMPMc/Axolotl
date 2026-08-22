FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libffi-dev \
    libssl-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app
RUN pip install --no-cache-dir .

RUN mkdir -p /data

# Use a shell form entrypoint so environment variables evaluate correctly
CMD redbot Axolotl --no-color --instance-path /data --token ${TOKEN} --prefix ${PREFIX:-!}
