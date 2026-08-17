#!/usr/bin/env bash

echo -e "\e[0;1;90m:: Installing \e[0;1;3;93mi3-wm\e[0;1;90m...\e[0m"

sudo pacman -S i3-wm dmenu clipmenu i3status

if command -v "yay" >/dev/null; then
  yay -S i3lock-fancy-git
else
  TMPDIR=$(mktemp -d)

  git clone "https://github.com/meskarune/i3lock-fancy.git" "$TMPDIR/i3lock-fancy"

  cd "$TMPDIR" || return
  sudo make install

  cd - >/dev/null || return
  rm -rf "$TMPDIR"
fi

CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}"
DOTFILES="${DOTFILES:-${HOME}/.yame}"

rm -rf "$CONFIG/i3"
ln -svf "$DOTFILES/config/i3" "$CONFIG/i3"
