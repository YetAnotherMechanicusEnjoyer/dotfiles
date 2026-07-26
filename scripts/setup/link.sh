#!/usr/bin/env bash

NVIM="lazyvim"
CONFIG="$HOME/.config"
DOTFILES="$HOME/.yame"

rm -rf "$CONFIG/fastfetch" "$CONFIG/ghostty" "$CONFIG/nvim" "$CONFIG/starship.toml" "$CONFIG/zshrc.d" "$CONFIG/hypr/custom"

printf "\e[1;3;94m"
ln -svf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -svf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -svf "$DOTFILES/config/fastfetch/" "$CONFIG/fastfetch"
ln -svf "$DOTFILES/config/ghostty/" "$CONFIG/ghostty"
ln -svf "$DOTFILES/config/$NVIM/" "$CONFIG/nvim"
ln -svf "$DOTFILES/config/starship.toml" "$CONFIG/starship.toml"
ln -svf "$DOTFILES/config/zshrc.d/" "$CONFIG/zshrc.d"
ln -svf "$DOTFILES/config/hypr/custom" "$CONFIG/hypr/custom"
sudo ln -svf "$DOTFILES/scripts/updatearch" "/usr/bin/updatearch"
printf "\e[0m"
