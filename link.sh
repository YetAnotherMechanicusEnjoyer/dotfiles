#!/bin/bash

echo -e "\n\e[1m\e[96mDo you want to link config files ?\e[0m"
gum confirm && echo || exit

echo -e "\e[1m\e[96mChoose a Neovim config.\e[0m"
NVIM=$(gum choose "lazyvim" "old_nvim")
CONFIG="$HOME/.config"
DOTFILES="$HOME/.yame"

rm -rf "$CONFIG/fastfetch" "$CONFIG/ghostty" "$CONFIG/nvim" "$CONFIG/starship.toml"

cp ./.zshrc ~/.yame/
cp ./.tmux.conf ~/.yame/

printf "\e[95m"
ln -svf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -svf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -svf "$DOTFILES/config/fastfetch/" "$CONFIG/fastfetch"
ln -svf "$DOTFILES/config/ghostty/" "$CONFIG/ghostty"
ln -svf "$DOTFILES/config/$NVIM/" "$CONFIG/nvim"
ln -svf "$DOTFILES/config/starship.toml" "$CONFIG/starship.toml"
sudo ln -svf "$DOTFILES/scripts/updatearch.sh" "/usr/bin/updatearch"
printf "\e[0m"
