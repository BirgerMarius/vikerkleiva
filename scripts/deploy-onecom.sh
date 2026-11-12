#!/usr/bin/env bash
set -euo pipefail

HOST="${ONECOM_HOST:-ssh.c15w4ukrj.service.one}"
USER="${ONECOM_USER:-c15w4ukrj_ssh}"
PORT="${ONECOM_PORT:-22}"
REMOTE_DIR="${ONECOM_REMOTE_DIR:-/webroots/www}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Deploy av vikerkleiva.no til One.com"
echo "Mål: $USER@$HOST:$REMOTE_DIR"

# Publiser kun filene som tilhører dette prosjektet.
# Ingen --delete: eksisterende mapper/filer som WordPress, innsatt/ og onewebmedia
# skal ikke kunne slettes ved et uhell.
rsync -avz   -e "ssh -p $PORT"   "$ROOT_DIR/index.html"   "$USER@$HOST:$REMOTE_DIR/index.html"

ssh -p "$PORT" "$USER@$HOST" "mkdir -p '$REMOTE_DIR/tour'"

rsync -avz   -e "ssh -p $PORT"   "$ROOT_DIR/tour/index.html"   "$USER@$HOST:$REMOTE_DIR/tour/index.html"

echo "Deploy fullført."
echo "Kontroller:"
echo "  https://vikerkleiva.no/"
echo "  https://vikerkleiva.no/tour/"
echo
echo "Hvis One.com viser gammel cache, kjør på serveren:"
echo "  cache-purge"
