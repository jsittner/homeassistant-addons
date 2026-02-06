#!/bin/sh
set -eu

# Ensure nginx directories exist (Alpine sometimes expects these)
mkdir -p /run/nginx

# Bind Trilium to localhost so only nginx can reach it
export TRILIUM_NETWORK_HOST="127.0.0.1"
export TRILIUM_NETWORK_PORT="${TRILIUM_NETWORK_PORT:-8080}"

echo "Starting Trilium (background) ..."
# Prefer upstream entrypoint if it exists
if command -v trilium > /dev/null 2>&1; then
  trilium &
elif [ -x /entrypoint.sh ]; then
  /entrypoint.sh &
elif [ -x /docker-entrypoint.sh ]; then
  /docker-entrypoint.sh &
else
  # last-resort: try to run node app if present
  if command -v node > /dev/null 2>&1 && [ -f /usr/src/app/main.cjs ]; then
    node /usr/src/app/main.cjs &
  else
    echo "ERROR: Could not determine how to start Trilium in this base image."
    echo "Please paste: ls -la / ; ls -la /usr/src/app ; ps -ef"
    exit 1
  fi
fi

echo "Starting nginx on :8099 ..."
nginx -g "daemon off;"
