TOKEN_FILE="$HOME/dotfiles/.tokens"

if [[ ! -f "$TOKEN_FILE" ]]; then
  echo "Error: File $TOKEN_FILE not found." >>"$HOME/.yame/errors.log"
  return 1 2>/dev/null
fi

FIRST_TOKEN=$(sed -n '1p' "$TOKEN_FILE")
SECOND_TOKEN=$(sed -n '2p' "$TOKEN_FILE")

export DISCORD_TOKEN="$FIRST_TOKEN"
export BOT_TOKEN="$SECOND_TOKEN"
