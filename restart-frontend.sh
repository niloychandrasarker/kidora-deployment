#!/bin/bash

set -e

echo "👉 Stopping old container if exists..."
docker rm -f kidora-frontend || true

echo "👉 Running new container..."
# Run new container
docker run -d -p 3000:80 --network kidora-deployment_kidora-network --name kidora-frontend kidora-frontend
echo "✅ Frontend Running on port 3000"