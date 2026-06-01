FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libsfml-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libx11-6 \
    xvfb \
    x11vnc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
