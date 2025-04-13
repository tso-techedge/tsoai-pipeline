#!/bin/bash
set -e

APP_DIR="/opt/tsoai"
cd "$APP_DIR"

echo "[+] Checking for updates..."

git fetch origin main
LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/main)

if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
  echo "[+] New version detected. Deploying..."

  git reset --hard origin/main
  docker compose down
  docker compose up -d --build

  echo "[✓] Deployment complete at $(date)"
else
  echo "[=] No updates at $(date)"
fi
