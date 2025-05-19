#!/bin/bash

set -e

FORMAT=$(gum choose "HTTPS" "SSH" "ZIP" "Cancel")

if [ "$FORMAT" == "HTTPS" ]; then
  git clone https://github.com/YetAnotherMechanicusEnjoyer/template.git ~/template
  git clone https://github.com/YetAnotherMechanicusEnjoyer/discord-autoupdater.git ./scripts/discord
elif [ "$FORMAT" == "SSH" ]; then
  git clone git@github.com:YetAnotherMechanicusEnjoyer/template.git ~/template
  git clone git@github.com:YetAnotherMechanicusEnjoyer/discord-autoupdater.git ./scripts/discord
elif [ "$FORMAT" == "ZIP" ]; then
  sh "$PWD"/scripts/download_zip.sh "https://github.com/YetAnotherMechanicusEnjoyer/template/archive/refs/heads/main.zip" "$HOME/template"
  sh "$PWD"/scripts/download_zip.sh "https://github.com/YetAnotherMechanicusEnjoyer/discord-autoupdater/archive/refs/heads/main.zip" "$PWD/scripts/discord"
fi
