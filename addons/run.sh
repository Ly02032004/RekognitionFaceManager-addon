#!/bin/bash
set -e

# Kéo image từ registry (Home Assistant tự động kéo dựa trên config.yaml)
echo "Starting Docker container from registry..."

# Chạy container với image đã định nghĩa
docker run -d \
  --name face \
  --restart unless-stopped \
  --network host \
  -v /data/facerekoginition/www/snapshots:/app/monitor \
  -v /data/facerekoginition/config.json:/app/config.json \
  -v /data/facerekoginition/logs:/app/logs \
  rekognitionfacemanager:2.0

echo "Container stopped."