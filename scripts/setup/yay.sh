#!/bin/bash

set -e

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay || exit 1
makepkg -si
cd - || exit 1
