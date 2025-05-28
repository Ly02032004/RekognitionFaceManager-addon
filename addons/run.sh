#!/bin/bash
set -e

# Kéo image từ registry (Home Assistant tự động kéo dựa trên config.yaml)
echo "Starting Docker container from registry..."
mkdir -p /config/facerekoginition
if [ ! -f /config/facerekoginition/config.json ]; then
  touch /config/facerekoginition/config.json
fi
# Chạy container với image đã định nghĩa
docker run -d \
  --name face \
  --restart unless-stopped \
  --network host \
  -e SECRET_KEY="$SECRET_KEY" \
  -e API_KEY="$API_KEY" \
  -e COLLECTION_ID="$COLLECTION_ID" \
  -e MQTT_HOST="$MQTT_HOST" \
  -e MQTT_PORT="$MQTT_PORT" \
  -e MQTT_USER="$MQTT_USER" \
  -e MQTT_PASS="$MQTT_PASS" \
  -e MONITOR_PATH="$MONITOR_PATH" \
  rekognitionfacemanager:2.7

echo "Container stopped."
