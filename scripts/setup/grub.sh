#!/bin/bash

set -e

git clone https://github.com/Lxtharia/minegrub-theme.git "$HOME"/YAME/grub
cd ~/YAME/
INSTALL="./grub/install_theme.sh"
sudo sh "$INSTALL"
sudo grub-mkconfig -o /boot/grub/grub.cfg
cd - >/dev/null
