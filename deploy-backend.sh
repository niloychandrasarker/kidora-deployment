#!/bin/bash
set -e

echo "👉 Pulling latest code..."
git pull

cd /app/kidora/kidora-backend

echo "👉 Stopping old container..."
docker stop kidora-backend || true
docker rm kidora-backend || true

echo "👉 Building backend image..."
docker build -t kidora-backend .

echo "👉 Running backend container..."
docker run -d \
  --name kidora-backend \
  --network kidora-network \
  --env-file .env-backend \
  -p 8081:8080 \
  kidora-backend

echo "✅ Backend deployed on port: 8081"
