#!/bin/sh
set -eu

echo "Starting Trilium on 127.0.0.1:8080"
export TRILIUM_NETWORK_HOST="127.0.0.1"
export TRILIUM_NETWORK_PORT="${TRILIUM_NETWORK_PORT:-8080}"

# Trilium image entrypoint typically starts the app via node.
# We start it in the background and keep nginx as PID 1.
node /usr/src/app/main.cjs &

echo "Starting nginx on :80"
nginx -g "daemon off;"

