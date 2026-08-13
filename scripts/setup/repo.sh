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
  "YetAnotherMechanicusEnjoyer/vimcord"
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
      sh "$DOTFILES/scripts/download_zip" "https://github.com/$AUTHOR/$REPO/archive/refs/heads/main.zip" "$REPODIR/$REPO"
    fi

    if cd "$REPODIR/$REPO" >&/dev/null; then
      [[ -f "$REPODIR/$REPO/build.zig" && "$REPO" != *"template"* ]] && zig build -j"$(nproc)"
      [[ -f "$REPODIR/$REPO/Cargo.toml" && "$REPO" != *"template"* ]] && cargo build -j "$(nproc)" --release
      [[ -f "$REPODIR/$REPO/Makefile" && "$REPO" != *"template"* ]] && make -j "$(nproc)"
      [[ -f "$REPODIR/$REPO/CMakeLists.txt" && "$REPO" != *"template"* ]] && cmake -S . -B build && cmake --build build --parallel "$(nproc)"
    else
      echo -e "\e[90m:: \e[1;91mERROR\e[0;90m - Cannot cd to \e[1;3;94m$REPODIR/$REPO\e[0;90m\e[0m" &&
        echo -e "\e[0;90m:: Press \e[1;94m[ENTER]\e[0;90m to close.\e[0m" &&
        read &&
        continue
    fi

    cd - >&/dev/null || echo -e "\e[90m:: \e[1;91mERROR\e[0;90m - Cannot cd back\e[0m"
    echo
  fi
done
