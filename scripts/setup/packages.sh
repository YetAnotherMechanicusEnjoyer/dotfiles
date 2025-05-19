#!/bin/bash

set -e

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
  mariadb \
  openssh \
  ghostty

sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl start docker
sudo systemctl enable docker
