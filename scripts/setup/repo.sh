#!/usr/bin/env bash

_buildZig() {
  echo -e "\e[0;1;90m   \e[0;1;3;93mzig\e[0;90m build --build-file \e[0;3;94m$1/build.zig\e[0;90m -j\"\$(nproc)\"\e[0m"
  zig build --build-file "$1/build.zig" -j"$(nproc)" -Doptimize=ReleaseFast
}

_buildCargo() {
  echo -e "\e[0;1;90m   \e[0;1;3;91mcargo\e[0;90m build --m \e[0;3;94m$1/Cargo.toml\e[0;90m -j \"\$(nproc)\" --release\e[0m"
  cargo build -m "$1/Cargo.toml" -j "$(nproc)" --release
}

_buildMakefile() {
  echo -e "\e[0;1;90m   \e[0;1;3;97mmake\e[0;90m -C \e[0;3;94m$1\e[0;90m -j \"\$(nproc)\"\e[0m"
  make -C "$1" -j "$(nproc)"
}

_buildCMake() {
  echo -e "\e[0;1;90m   \e[0;1;3;96mcmake\e[0;90m -S \e[0;3;94m$1\e[0;90m -B $2 && cmake --build $2 --parallel \"\$(nproc)\"\e[0m"
  cmake -S "$1" -B "$2" && cmake --build "$2" --parallel "$(nproc)"
}

_compile() {
  local dir="$1"
  echo -e "\e[0;90m   Compiling \e[0;1;3;94m$entry\e[0;90m...\e[0m"

  [[ -f "$dir/build.zig" ]] && _buildZig "$dir"
  [[ -f "$dir/Cargo.toml" ]] && _buildCargo "$dir"
  [[ -f "$dir/Makefile" ]] && _buildMakefile "$dir"
  [[ -f "$dir/CMakeLists.txt" ]] && _buildCMake "$dir" "$dir/build"
}

REPODIR="${REPODIR:-${HOME}/.yamerepo}"
mkdir -p "$REPODIR"

if [ "$#" -gt 0 ]; then
  REPOSITORIES=("$@")
else
  DEFAULT_REPOS="YetAnotherMechanicusEnjoyer/template HTTPS
YetAnotherMechanicusEnjoyer/zig-template HTTPS
YetAnotherMechanicusEnjoyer/discord-autoupdater HTTPS
YetAnotherMechanicusEnjoyer/herma HTTPS
YetAnotherMechanicusEnjoyer/vimcord HTTPS"

  USER_INPUT=$(gum write \
    --header "List of repositories to clone. Format: Author/Repo [HTTPS|SSH|ZIP] (Defaults to HTTPS). One per line:" \
    --value "$DEFAULT_REPOS" \
    --width 100 --height 12)

  if [ -z "$USER_INPUT" ]; then
    echo -e "\e[0;91mOperation cancelled or no list provided.\e[0m"
    exit 0
  fi

  mapfile -t REPOSITORIES <<<"$USER_INPUT"
fi

echo ""

for entry in "${REPOSITORIES[@]}"; do
  [[ -z "$entry" ]] && continue

  read -r REPO_PATH CLONE_FORMAT <<<"$entry"

  AUTHOR="${REPO_PATH%%/*}"
  REPO="${REPO_PATH##*/}"

  CLONE_FORMAT=$(echo "$CLONE_FORMAT" | tr '[:lower:]' '[:upper:]')
  if [[ ! "$CLONE_FORMAT" =~ ^(HTTPS|SSH|ZIP)$ ]]; then
    CLONE_FORMAT="HTTPS"
  fi

  if [[ ! -d "$REPODIR/$REPO" ]]; then
    echo -e "\e[0;1;90m:: Cloning \e[0;1;3;94m$REPO_PATH\e[0;1;90m via \e[0;1;3;95m$CLONE_FORMAT\e[0m"

    if [ "$CLONE_FORMAT" == "HTTPS" ]; then
      git clone "https://github.com/$AUTHOR/$REPO.git" "$REPODIR/$REPO"
    elif [ "$CLONE_FORMAT" == "SSH" ]; then
      git clone "git@github.com:$AUTHOR/$REPO.git" "$REPODIR/$REPO"
    elif [ "$CLONE_FORMAT" == "ZIP" ]; then
      sh "$DOTFILES/scripts/download_zip" "https://github.com/$AUTHOR/$REPO/archive/refs/heads/main.zip" "$REPODIR/$REPO"
    fi

    if [[ "$REPO" != *"template"* ]]; then
      _compile "$REPODIR/$REPO"
    else
      echo -e "   \e[0;90mNo need to compile template repositories\e[0m"
    fi

  else
    echo -e "\e[0;1;90m:: \e[0;1;93mWARN\e[0;1;90m - \e[0;1;3;94m$REPODIR/$REPO\e[0;1;90m already exists, ignoring...\e[0m"
  fi

  echo
done
