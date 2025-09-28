#!/bin/bash

set -e

# Go to the frontend project
cd /app/kidora/Kidora-main

# Pull latest code
git pull origin main

# Stop and remove old container if exists
docker rm -f kidora-frontend || true

# Build new Docker image
docker build -t kidora-frontend .

# Run new container
docker run -d \
    --network kidora-deployment_kidora-network \
    --name kidora-frontend \
    -p 8080:80 \
    kidora-frontend

# Follow logs
docker logs -f kidora-frontend

