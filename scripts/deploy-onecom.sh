#!/usr/bin/env bash
set -euo pipefail

HOST="${ONECOM_HOST:-ssh.c15w4ukrj.service.one}"
USER="${ONECOM_USER:-c15w4ukrj_ssh}"
PORT="${ONECOM_PORT:-22}"
REMOTE_DIR="${ONECOM_REMOTE_DIR:-}"

if [[ -z "$REMOTE_DIR" ]]; then
  echo "FEIL: ONECOM_REMOTE_DIR er ikke satt."
  echo "Logg inn først med:"
  echo "  ssh -p $PORT $USER@$HOST"
  echo "Kjør pwd/ls og sett deretter webroten, f.eks.:"
  echo "  export ONECOM_REMOTE_DIR=/path/to/webroot"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Deploy til One.com..."
rsync -avz --delete   --exclude '.git/'   --exclude 'scripts/'   --exclude 'README.md'   -e "ssh -p $PORT"   "$ROOT_DIR/" "$USER@$HOST:$REMOTE_DIR/"

echo "Deploy fullført."
