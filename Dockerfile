FROM python:3.11-slim-bookworm

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev \
    ffmpeg \
    git \
    locales \
    && sed -i '/^# *en_US.UTF-8/s/^# *//' /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN python -m pip install --upgrade pip setuptools wheel

RUN pip install .

RUN mkdir -p /data

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/data"]

ENTRYPOINT ["/start.sh"]
