#!/usr/bin/env bash

NVIM="lazyvim"
CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}"
DOTFILES="${DOTFILES:-${HOME}/.yame}"
REPODIR="${REPODIR:-${HOME}/.yamerepo}"

rm -rf "$CONFIG/fastfetch" "$CONFIG/ghostty" "$CONFIG/nvim" "$CONFIG/starship.toml" "$CONFIG/zshrc.d" "$CONFIG/hypr/custom"

printf "\e[1;3;94m"
ln -svf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -svf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -svf "$DOTFILES/config/fastfetch/" "$CONFIG/fastfetch"
ln -svf "$DOTFILES/config/ghostty/" "$CONFIG/ghostty"
ln -svf "$DOTFILES/config/$NVIM/" "$CONFIG/nvim"
ln -svf "$DOTFILES/config/starship.toml" "$CONFIG/starship.toml"
ln -svf "$DOTFILES/config/zshrc.d/" "$CONFIG/zshrc.d"
sudo ln -svf "$DOTFILES/scripts/download_zip" "/usr/bin/download_zip"
sudo ln -svf "$DOTFILES/scripts/extract" "/usr/bin/extract"
sudo ln -svf "$DOTFILES/scripts/updatearch" "/usr/bin/updatearch"

[[ -d "$CONFIG/hypr" ]] && ln -svf "$DOTFILES/config/hypr/custom" "$CONFIG/hypr/custom"
[[ -f "$REPODIR/wayra/zig-out/bin/herma" ]] && sudo ln -svf "$REPODIR/wayra/zig-out/bin/herma" "/usr/bin/herma"
[[ -f "$REPODIR/vimcord/target/release/vimcord" ]] && sudo ln -svf "$REPODIR/vimcord/target/release/vimcord" "/usr/bin/vimcord"
printf "\e[0m"
