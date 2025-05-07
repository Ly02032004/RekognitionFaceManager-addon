#!/bin/bash
set -e

# Kéo image từ registry (Home Assistant tự động kéo dựa trên config.yaml)
echo "Starting Docker container from registry..."

# Chạy container với image đã định nghĩa
docker run -d \
  --name face \
  --restart unless-stopped \
  --network host \
  -v /config/facerekoginition/snapshots:/app/monitor \
  -v /config/facerekoginition/config.json:/app/config.json \
  -v /config/facerekoginition/logs:/app/logs \
  rekognitionfacemanager:2.0

echo "Container stopped."
