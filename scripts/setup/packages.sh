#!/bin/bash

sudo pacman -S \
  zsh \
  fzf \
  eza \
  zoxide \
  starship \
  valgrind \
  neovim \
  lazygit \
  vim \
  nano \
  fastfetch \
  criterion \
  tmux \
  cmake \
  discord \
  bear \
  gum \
  docker \
  docker-compose \
  mariadb \
  openssh \
  luarocks \
  npm \
  nodejs \
  os-prober \
  firefox \
  sddm \
  lua \
  ghostty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl enable sddm

sudo usermod -a -G docker "$USER"

sudo chsh -s /usr/bin/zsh "$USER"
gum log --structured --level warn "Restart to change your default shell" shell "zsh"
