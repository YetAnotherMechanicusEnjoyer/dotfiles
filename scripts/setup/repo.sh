#!/usr/bin/env bash

FORMAT=$(gum choose "HTTPS" "SSH" "ZIP" "Cancel")
DOTFILES="$HOME/.yame"
REPODIR="$HOME/.yamerepo"

mkdir -p "$REPODIR"
if [ "$FORMAT" == "HTTPS" ]; then
  git clone "https://github.com/YetAnotherMechanicusEnjoyer/template.git" "$REPODIR/template"
  git clone "https://github.com/YetAnotherMechanicusEnjoyer/discord-autoupdater.git" "$REPODIR/discord-autoupdater"
elif [ "$FORMAT" == "SSH" ]; then
  git clone "git@github.com:YetAnotherMechanicusEnjoyer/template.git" "$REPODIR/template"
  git clone "git@github.com:YetAnotherMechanicusEnjoyer/discord-autoupdater.git" "$REPODIR/discord-autoupdater"
elif [ "$FORMAT" == "ZIP" ]; then
  sh "$DOTFILES/scripts/download_zip.sh" "https://github.com/YetAnotherMechanicusEnjoyer/template/archive/refs/heads/main.zip" "$REPODIR/template"
  sh "$DOTFILES/scripts/download_zip.sh" "https://github.com/YetAnotherMechanicusEnjoyer/discord-autoupdater/archive/refs/heads/main.zip" "$REPODIR/discord-autoupdater"
fi
