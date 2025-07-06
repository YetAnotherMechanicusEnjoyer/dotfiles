#!/bin/bash

set -e

git clone https://github.com/Lxtharia/minegrub-theme.git ~/YAME/grub
sh ~/YAME/grub/choose_background.sh
sudo ~/YAME/grub/install_theme.sh
