FROM python:3.12-slim


ENV DEBIAN_FRONTEND=noninteractive \
POETRY_VIRTUALENVS_IN_PROJECT=true \
VERSION_CHECK=1


# Basic CLI tools + Neovim + Node + npm + pyright (LSP server)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates ripgrep fd-find nodejs npm bash-completion \
    build-essential pkg-config unzip xclip
    

RUN set -eux; \
    curl -fL -o /tmp/nvim-linux-x86_64.tar.gz \
      https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz; \
    tar -C /opt -xzf /tmp/nvim-linux-x86_64.tar.gz; \
    ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim; \
    rm /tmp/nvim-linux-x86_64.tar.gz


RUN ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && npm install -g pyright \
    && pip install --no-cache-dir poetry \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /workspace
