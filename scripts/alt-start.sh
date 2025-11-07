#!/usr/bin/env bash
docker build -t py-nvim-sandbox -f .devcontainer/Dockerfile .

docker run -d --name py-nvim-dev \
	-e DISPLAY=:0 \
	-e WAYLAND_DISPLAY=wayland-0 \
	-v "$(pwd)":/workspace \
	-v "$HOME/.config/nvim":/root/.config/nvim:ro \
	-v "$HOME/.local/share/nvim":/root/.local/share/nvim \
	-v "/mnt/wslg/.X11-unix:/tmp/.X11-unix"
	-w /workspace \
	py-nvim-sandbox bash -lc "sleep infinity"

docker exec -it py-nvim-dev bash -lc 'poetry install --no-root && nvim .'