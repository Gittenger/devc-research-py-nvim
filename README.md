# Neovim in Container (Python + Poetry + Pyright)


This repo demonstrates running Neovim **inside** a container while mounting your local Neovim config and editing the workspace files.


## Dependencies
- Docker + Docker Compose v2
- Neovim config at `~/.config/nvim` (mounted read-only)
- X server -- my setup is for a Windows working machine with WSLg/Xwayland
  - Recommended for clipboard support, but OSC is configured as fallback


## Quickstart


```bash
# 1) Build and start the dev container, install deps, open Neovim
./scripts/devnvim.sh


# 2) In another terminal, open a shell in the same container
docker compose exec dev bash


# 3) Run the app inside the container (uses project-local .venv)
poetry run python src/app.py


# 4) (Optional) Run tests / formatters
poetry run pytest
poetry run ruff check .
poetry run black --check .
