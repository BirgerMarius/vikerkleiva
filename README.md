# vikerkleiva.no

Statisk nettsted for **vikerkleiva.no**.

## Struktur

- `index.html` – enkel offentlig forside
- `tour/index.html` – privat-delt reiseplan for Tour de France 2027 (ikke lenket fra forsiden)
- `scripts/deploy-onecom.sh` – deploy til One.com via SSH/rsync

## Arbeidsflyt

1. Gjør endringer lokalt eller via Codex.
2. Commit og push til `main`.
3. På docker01:
   ```bash
   cd /home/aiworker/workspace/projects/vikerkleiva
   git pull --ff-only origin main
   ./scripts/deploy-onecom.sh
   ```

## One.com

SSH/SFTP:
- Host: `ssh.c15w4ukrj.service.one`
- User: `c15w4ukrj_ssh`
- Port: `22`

Passord eller andre hemmeligheter skal aldri lagres i repoet.

Deploy-scriptet forventer at `ONECOM_REMOTE_DIR` peker til webroten på One.com. Eksakt katalog bekreftes etter første SSH-innlogging.
