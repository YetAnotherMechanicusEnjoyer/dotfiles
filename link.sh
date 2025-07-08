#!/bin/bash

echo -e "\n\e[1m\e[96mDo you want to link config files ?\e[0m"
gum confirm && echo || exit

echo -e "\e[1m\e[96mChoose a Neovim config.\e[0m"
NVIM=$(gum choose "lazyvim" "old_nvim")
CONFIG="$HOME/.config"

rm -rf "$CONFIG/fastfetch" "$CONFIG/ghostty" "$CONFIG/nvim" "$CONFIG/starship.toml"

cp ./.zshrc ~/YAME/
cp ./.tmux.conf ~/YAME/

printf "\e[95m"
ln -svf "$HOME/YAME/.zshrc" "$HOME/.zshrc"
ln -svf "$HOME/YAME/.tmux.conf" "$HOME/.tmux.conf"
ln -svf "$HOME/YAME/config/fastfetch/" "$CONFIG/fastfetch"
ln -svf "$HOME/YAME/config/ghostty/" "$CONFIG/ghostty"
ln -svf "$HOME/YAME/config/$NVIM/" "$CONFIG/nvim"
ln -svf "$HOME/YAME/config/starship.toml" "$CONFIG/starship.toml"
printf "\e[0m"
