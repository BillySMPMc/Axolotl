FROM python:3.11-slim

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

# Set the environment variable for Red's data path storage
ENV RED_STORAGE_TYPE=JSON
ENV RED_DATA_PATH=/data

# Start the bot instance named Axolotl
CMD ["redbot", "Axolotl", "--token", "${TOKEN}"]
