#!/bin/bash

set -e

yay -S tmux-plugin-manager

if [ ! -d "$HOME/.config/tmux/plugins/catppuccin/tmux/" ]; then
  mkdir -p ~/.config/tmux/plugins/catppuccin/
  git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
fi
