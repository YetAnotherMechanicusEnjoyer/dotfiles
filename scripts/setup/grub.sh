#!/bin/bash

set -e

if [ ! -d "$HOME/.yame/grub" ]; then
  git clone https://github.com/Lxtharia/double-minegrub-menu.git "$HOME"/.yame/grub
fi
cd ~/.yame/
INSTALL="./grub/install.sh"
sudo sh "$INSTALL"
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
cd - >/dev/null
