#!/bin/bash

set -e

git clone https://github.com/Lxtharia/double-minegrub-menu.git "$HOME"/YAME/grub
cd ~/YAME/
INSTALL="./grub/install.sh"
sudo sh "$INSTALL"
sudo grub-mkconfig -o /boot/grub/grub.cfg
cd - >/dev/null
