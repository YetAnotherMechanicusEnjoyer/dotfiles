CONFIG_ZSHRC="${CONFIG_ZSHRC:-${HOME}/.config/zshrc.d}"

FILES=("zinit" "exports" "setopt" "autoload" "evals" "bindkeys" "aliases" "sources" "load_tokens" "custom" "exec")

for file in ${FILES[@]}; do
  if [ -f "$CONFIG_ZSHRC/$file.zsh" ]; then
      source "$CONFIG_ZSHRC/$file.zsh"
  fi
done
