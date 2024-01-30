#!/usr/bin/env bash

image_name="ubuntu-desktop"

container_name="ubuntu-desktop-container"

dockerfile_path="Dockerfile-xrdp.lubuntu"

# Stop any existing containers with the same name
if docker ps -a --format '{{.Names}}' | grep -q "^${container_name}$"; then
    echo "Stopping and removing existing ${container_name}..."
    docker stop "${container_name}"
    docker rm "${container_name}"
fi

# Remove unused Docker images to clean up space
echo "Removing unused Docker images..."
docker image prune -f

# Build the Docker image
if docker build -f "${dockerfile_path}" -t "${image_name}" .; then
    echo "Running the Docker container..."
    docker run --name "${container_name}" -d -p 3389:3389 \
    "${image_name}"
else
    echo "Docker build failed. Exiting..."
    exit 1
fi
