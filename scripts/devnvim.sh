#!/usr/bin/env bash
set -euo pipefail

docker compose up -d dev
docker compose exec dev bash -lc '
python -V;
if ! command -v poetry >/dev/null; then pip install --no-cache-dir poetry; fi;
poetry install --no-root;
'
docker compose exec dev bash -lc 'nvim .'