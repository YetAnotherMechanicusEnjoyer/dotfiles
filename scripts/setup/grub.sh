#!/bin/bash

set -e

git clone https://github.com/Lxtharia/minegrub-theme.git "$HOME"/YAME/grub
sh ~/YAME/grub/choose_background.sh
cd ~/YAME/
INSTALL="./grub/install_theme.sh"
sudo sh "$INSTALL"
cd - >/dev/null
