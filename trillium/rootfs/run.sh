#!/bin/sh
set -eu

echo "=== Trilium Ingress Startup ==="

# Ensure nginx directories exist
mkdir -p /run/nginx /var/log/nginx

# Test nginx config
echo "Testing nginx configuration..."
nginx -t || { echo "ERROR: nginx config test failed!"; exit 1; }

# Bind Trilium to localhost
export TRILIUM_NETWORK_HOST="127.0.0.1"
export TRILIUM_NETWORK_PORT="${TRILIUM_NETWORK_PORT:-8080}"

echo "Starting Trilium on ${TRILIUM_NETWORK_HOST}:${TRILIUM_NETWORK_PORT} (background)..."

# Start Trilium in background
if command -v trilium > /dev/null 2>&1; then
  echo "Using 'trilium' command"
  trilium &
elif [ -x /entrypoint.sh ]; then
  echo "Using /entrypoint.sh"
  /entrypoint.sh &
elif [ -x /docker-entrypoint.sh ]; then
  echo "Using /docker-entrypoint.sh"
  /docker-entrypoint.sh &
else
  if command -v node > /dev/null 2>&1 && [ -f /usr/src/app/main.cjs ]; then
    echo "Using node /usr/src/app/main.cjs"
    cd /usr/src/app
    node main.cjs &
  else
    echo "ERROR: Could not determine how to start Trilium"
    echo "=== Directory listing: / ==="
    ls -la /
    echo "=== Directory listing: /usr/src/app ==="
    ls -la /usr/src/app 2>/dev/null || echo "Directory not found"
    exit 1
  fi
fi

TRILIUM_PID=$!
echo "Trilium started with PID: $TRILIUM_PID"

# Wait for Trilium to start
echo "Waiting for Trilium to be ready on port 8080..."
for i in $(seq 1 30); do
  if nc -z 127.0.0.1 8080 2>/dev/null; then
    echo "Trilium is ready!"
    break
  fi
  if [ $i -eq 30 ]; then
    echo "ERROR: Trilium failed to start on port 8080 after 30 seconds"
    exit 1
  fi
  sleep 1
  echo "Waiting... ($i/30)"
done

echo "Starting nginx on :8099..."
exec nginx -g "daemon off;"
