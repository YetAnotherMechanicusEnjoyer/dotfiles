#!/bin/bash

set -e

if [ ! -d "$HOME/.yame/sddm" ]; then
  git clone https://github.com/Davi-S/sddm-theme-minesddm.git "$HOME"/.yame/sddm
fi
cd ~/.yame/
sudo cp -r ./sddm/minesddm /usr/share/sddm/themes/
sudo sed -i '/^\[Theme\]/,/^\[/ s/^Current=.*/minesddm/' /usr/lib/sddm/sddm.conf.d/default.conf
cd - >/dev/null
