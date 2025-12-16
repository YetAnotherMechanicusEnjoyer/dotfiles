#!/bin/bash

TOKEN_FILE="$HOME/dotfiles/.tokens"

if [[ ! -f "$TOKEN_FILE" ]]; then
  echo "Error: File $TOKEN_FILE not found."
  return 1 2>/dev/null
fi

export DISCORD_TOKEN=$(sed -n '1p' "$TOKEN_FILE")
export BOT_TOKEN=$(sed -n '2p' "$TOKEN_FILE")
