#!/bin/bash

set -e

sudo pacman -S --needed base-devel git
if [ ! -d "$HOME/yay" ]; then
  git clone https://aur.archlinux.org/yay.git ~/yay
fi
cd ~/yay || exit 1
makepkg -si
cd - || exit 1
