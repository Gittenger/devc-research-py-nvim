#!/usr/bin/env bash
set -euo pipefail


# Build and start container (detached)
docker compose up -d dev


# Ensure Poetry env exists & deps installed inside the container
# (idempotent: safe to run repeatedly)
docker compose exec dev bash -lc '
python -V;
if ! command -v poetry >/dev/null; then pip install --no-cache-dir poetry; fi;
poetry install --no-root;
'


# Open Neovim in the workspace. Secondary terminals: `docker compose exec dev bash`
docker compose exec dev bash -lc 'nvim .'