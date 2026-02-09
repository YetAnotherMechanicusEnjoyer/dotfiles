alias gc="git clone"
alias gcp="sh $DOTFILES_PATH/scripts/push_that.sh"
alias gp="git pull"

alias http="python3 -m http.server"

alias cds="sh $DOTFILES_PATH/scripts/coding-style.sh . . && cat coding-style-reports.log && rm -f coding-style-reports.log"

alias zshrc="$EDITOR ~/.zshrc"

alias n="$EDITOR"
alias sn="sudo -e"

alias h="history | tail -20 | bat --color=always"

alias nf="fastfetch"
alias pf="fastfetch"
alias ff="fastfetch"

alias clear="clear && ff"
alias c='clear'

alias l='eza -x --icons=always --hyperlink --color=always'
alias ls='eza -ax --icons=always --hyperlink --color=always'
alias ll='eza -alx --icons=always --hyperlink --color=always'
alias tree='eza -aTx -I ".git" --icons=always --hyperlink --color=always'

alias clock='tclock -c Yellow'
alias timer='tclock timer -P -d'
alias countdown='tclock countdown -t'
alias chrono='tclock stopwatch'

alias re='make re'
alias fclean='make fclean'

alias please='/usr/bin/sudo'
alias sl='ls'

alias ta='tmux attach'

alias iusearchbtw="docker build -t arch ~/dotfiles/docker/archlinux/ && docker run --rm -it arch /bin/bash"
