#!/bin/bash
set -e

echo "👉 Stopping old container..."
docker stop kidora-backend || true
echo "👉 Removing old container..."
docker rm kidora-backend || true

echo "👉 Running backend container..."
docker run -d \
  --name kidora-backend \
  --network kidora-deployment_kidora-network \
  --env-file .env-backend \
  -p 8081:8080 \
  kidora-backend

echo "✅ Backend deployed on port 8081"
