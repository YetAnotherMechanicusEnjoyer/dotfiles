alias gc="git clone"
alias gcp="sh $DOTFILES/scripts/push_that.sh"
alias gp="git pull"

alias http="/usr/bin/sudo wayra --bind :: 80 -d $HOME/.http"

alias cds="sh $DOTFILES/scripts/coding-style.sh . . && cat coding-style-reports.log && rm -f coding-style-reports.log"

alias zshrc="$EDITOR ~/.zshrc"

alias n="$EDITOR"
alias sn="sudo -e"

alias h="history | tail -20 | bat --color=always"

alias nf="fastfetch"
alias pf="fastfetch"
alias ff="mew --full"

alias clear="clear && ff"
alias c='clear'

alias l='eza -x --icons=always --hyperlink --color=always'
alias ls='eza -ax --icons=always --hyperlink --color=always'
alias ll='eza -alx --icons=always --hyperlink --color=always'
alias llt='eza -alx --icons=always --hyperlink --color=always --total-size'
alias tree='eza -aTx -I ".git" --icons=always --hyperlink --color=always'

alias ls='ll'

alias re='make -j $(nproc) re'
alias fclean='make fclean'

alias please='/usr/bin/sudo'
alias sl='ls'

alias ta='tmux attach'

alias iusearchbtw="docker build -t arch ~/dotfiles/docker/archlinux/ && docker run --rm -it arch /bin/bash"

alias cm="cmake -S . -B build && cmake --build build --parallel $(nproc)"

alias grep="rg"

alias zb="zig build -j$(nproc)"

alias cargo-update='cargo install --list | awk '\''match($0, /^((\S+)\s+v\S+(\s+\(([^[:space:]?#)]+)(\?(branch|tag|rev)=([^[:space:]#)]+))?(#[^[:space:])]+)?\))?):/, m) { if (!m[4]) { cmd="cargo install " m[2] } else if (!m[8]) { print "\033[33mWarning: Skipping " m[1] "\033[0m" > "/dev/stderr"; cmd="" } else if (m[6]) { cmd="cargo install --git " m[4] " --" m[6] " " m[7] " " m[2] } else { cmd="cargo install --git " m[4] " " m[2] }; if (cmd) system(cmd) }'\'''
