if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  mkdir -p ~/.cache
  exec Hyprland > ~/.cache/hyprland.log 2>&1
fi

if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt; then
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi
