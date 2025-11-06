#!/usr/bin/env bash
docker build -t py-nvim-sandbox -f .devcontainer/Dockerfile .

docker run -d --name py-nvim-dev \
-v "$(pwd)":/workspace \
-v "$HOME/.config/nvim":/root/.config/nvim:ro \
-v "$HOME/.local/share/nvim":/root/.local/share/nvim \
-w /workspace \
py-nvim-sandbox bash -lc "sleep infinity"

docker exec -it py-nvim-dev bash -lc 'poetry install --no-root && nvim .'