#!/bin/bash
set -e

cd /app/kidora/kidora-backend

echo "👉 Pulling latest code..."
git pull

echo "👉 Stopping old container..."
docker stop kidora-backend || true
docker rm kidora-backend || true

echo "👉 Building backend image..."
docker build -t kidora-backend .

cd /app/kidora/kidora-deployment
echo "👉 Running backend container..."
docker run -d \
  --name kidora-backend \
  --network kidora-deployment_kidora-network \
  --env-file .env-backend \
  -p 8081:8080 \
  -v /app/kidora/storage:/app/uploads \
  kidora-backend

echo "✅ Backend deployed on port: 8081"
