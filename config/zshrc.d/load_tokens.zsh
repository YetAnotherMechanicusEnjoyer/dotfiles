TOKEN_FILE="$DOTFILES_PATH/.tokens"

if [[ ! -f "$TOKEN_FILE" ]]; then
  dt=$(date '+%d/%m/%Y %H:%M:%S');
  echo "[$dt] Error: File $TOKEN_FILE not found." >>"$DOTFILES_PATH/errors.log"
  return 1 2>/dev/null
fi

FIRST_TOKEN=$(sed -n '1p' "$TOKEN_FILE")
SECOND_TOKEN=$(sed -n '2p' "$TOKEN_FILE")

export DISCORD_TOKEN="$FIRST_TOKEN"
export BOT_TOKEN="$SECOND_TOKEN"
