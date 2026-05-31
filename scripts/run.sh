#!/bin/bash
set -e

# TODO: Replace with your pushed Docker image name
IMAGE_NAME="phantom7710/team15_project:0.1.0"

cd "$(dirname "$0")/.."

# Allow Docker to use the local X11 display
xhost +local:docker 2>/dev/null || true

docker run -it --rm \
  --platform linux/amd64 \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$(pwd)":/workspace \
  --name farm-sim-container \
  "$IMAGE_NAME" \
  /workspace/build/main
