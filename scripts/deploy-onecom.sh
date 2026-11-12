#!/usr/bin/env bash
set -euo pipefail

HOST="${ONECOM_HOST:-ssh.c15w4ukrj.service.one}"
USER="${ONECOM_USER:-c15w4ukrj_ssh}"
PORT="${ONECOM_PORT:-22}"
REMOTE_DIR="${ONECOM_REMOTE_DIR:-/webroots/www}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Deploy av vikerkleiva.no til One.com"
echo "Mål: $USER@$HOST:$REMOTE_DIR"

cd "$ROOT_DIR"

tar -cf - index.html tour/index.html |   ssh -p "$PORT" "$USER@$HOST" "mkdir -p '$REMOTE_DIR/tour' && cd '$REMOTE_DIR' && tar -xf - && cache-purge"

echo "Deploy fullført."
echo "Kontroller:"
echo "  https://vikerkleiva.no/"
echo "  https://vikerkleiva.no/tour/"
echo
echo "One.com-cache er tømt automatisk."
