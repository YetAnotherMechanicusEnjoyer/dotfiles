#!/bin/bash

set -e

echo -e "\n\e[1m\e[96mDo you want to link config files ?\e[0m"
gum confirm && echo || exit

echo -e "\e[1m\e[96mChoose a Neovim config.\e[0m"
NVIM=$(gum choose "lazyvim" "nvchad" "old_nvim")
CONFIG="$HOME/.config"

rm -rf "$CONFIG/fastfetch" "$CONFIG/ghostty" "$CONFIG/nvim" "$CONFIG/starship.toml"

printf "\e[95m"
ln -sv "./.zshrc" "$HOME/.zshrc"
ln -sv "./.tmux.conf" "$HOME/.tmux.conf"
ln -sv "$PWD/.config/fastfetch" "$CONFIG/fastfetch"
ln -sv "$PWD/.config/ghostty/" "$CONFIG/ghostty"
ln -sv "$PWD/.config/$NVIM" "$CONFIG/nvim"
ln -sv "$PWD/.config/starship.toml" "$CONFIG/starship.toml"
printf "\e[0m"
