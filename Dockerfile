FROM ubuntu:22.04

# Install dependencies for lazyvim dev environment
RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    g++ \
    gcc \
    make \
    cmake \
    neovim \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Install lazyvim
RUN git clone https://github.com/LazyVim/starter ~/.config/nvim && \
    rm -rf ~/.config/nvim/.git

RUN nvim :LazyHealth

ENTRYPOINT [ "nvim" ]
