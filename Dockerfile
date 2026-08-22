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

# Pass token via environment variable which Red reads automatically
ENV RED_TOKEN=${TOKEN}

CMD ["redbot", "Axolotl", "--no-color", "--instance-path", "/data"]
