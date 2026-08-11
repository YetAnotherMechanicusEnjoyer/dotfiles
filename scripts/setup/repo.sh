#!/usr/bin/env bash

set -e

FORMAT=$(gum choose "HTTPS" "SSH" "ZIP" "Cancel")

if [ "$FORMAT" == "Cancel" ] || [ -z "$FORMAT" ]; then
  exit 0
fi

DOTFILES="$HOME/.yame"
REPODIR="$HOME/.yamerepo"

mkdir -p "$REPODIR"
REPOSITORIES=(
  "YetAnotherMechanicusEnjoyer/template"
  "YetAnotherMechanicusEnjoyer/zig-template"
  "YetAnotherMechanicusEnjoyer/discord-autoupdater"
  "YetAnotherMechanicusEnjoyer/herma"
  "YetAnotherMechanicusEnjoyer/wayra"
)

for entry in "${REPOSITORIES[@]}"; do
  AUTHOR="${entry%%/*}"
  REPO="${entry##*/}"

  if [[ ! -d "$REPODIR/$REPO" ]]; then
    if [ "$FORMAT" == "HTTPS" ]; then
      git clone "https://github.com/$AUTHOR/$REPO.git" "$REPODIR/$REPO"
    elif [ "$FORMAT" == "SSH" ]; then
      git clone "git@github.com:$AUTHOR/$REPO.git" "$REPODIR/$REPO"
    elif [ "$FORMAT" == "ZIP" ]; then
      sh "$DOTFILES/scripts/download_zip.sh" "https://github.com/$AUTHOR/$REPO/archive/refs/heads/main.zip" "$REPODIR/$REPO"
    fi
  fi
done

cd "$REPODIR/herma" && zig build
cd - >/dev/null
cd "$REPODIR/wayra" && zig build
cd - >/dev/null
