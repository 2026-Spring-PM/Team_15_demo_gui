#!/bin/bash
set -e

# TODO: Replace with your Docker Hub username and team number
IMAGE_NAME="whalswo/team15_project:0.1.0"

cd "$(dirname "$0")/.."
docker build -t "$IMAGE_NAME" docker/

echo "Docker image built: $IMAGE_NAME"
echo "Push with: docker push $IMAGE_NAME"
