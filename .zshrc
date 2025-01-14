# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
#./var/tmp/systemd-private-4b06f9359a9479398eabbef5df45e-systempower/system_sup_power.sh
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt GLOB_DOTS
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a --color $realpath'

# Aliases
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
plugins=(
    aliases
    alias-finder
    battery
    colored-man-pages
    command-not-found
    common-aliases
    copyfile
    copypath
    docker
    git
    git-commit
    git-prompt
    kitty
    sudo
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-syntax-highlighting
    archlinux
)
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# Activer l'auto-complétion
autoload -Uz compinit && compinit

#pokemon-colorscripts --no-title -s -r

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

GIT_PATH="Git/backup/everyting/config_zsh"
EDITOR="nvim"

#Git
alias train_de_la_hype="sh $HOME/$GIT_PATH/push_that.sh"
alias ramene_le_coton="git pull";

#Server
alias http_python_server="python3 -m http.server"

#template
alias template="cp -r ~/template/include . && cp -r ~/template/src . && cp ~/template/Makefile ."

#coding style
alias gestapo="sh ~/Git/backup/everyting/coding-style-checker/coding-style.sh . ."
alias documents_secret_defense="cat coding-style-reports.log"
alias censure="rm -f coding-style-reports.log"
alias appel_du_parti="gestapo && documents_secret_defense && censure"

#rm
alias grand_terrassement="sh $HOME/$GIT_PATH/mr_clean"

#zsh
alias zshrc="$EDITOR ~/.zshrc"

#clear
alias clear="clear && ff"

# Afficher l'historique avec des commandes utiles (par exemple l'alias 'h' pour afficher l'historique)
alias h='history | tail -20 | bat --color=always'

alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch --config examples/13'

MONITORS="~/.config/hypr/conf/monitor.conf"
alias double_screen="cp ~/backup/monitor/doublescreen/monitor.conf $MONITORS"
alias single_screen="cp ~/backup/monitor/singlescreen/monitor.conf $MONITORS"

alias cr="cargo build && sleep 0.2 && cargo run"

alias zed="zed ."
alias code="zed"

alias l='eza -x --icons=always --hyperlink --color=always'
alias ls='eza -x --icons=always --hyperlink --color=always -a'
alias ll='eza -alx --icons=always --hyperlink --color=always'
alias tree='eza -aTx --icons=always --hyperlink --color=always'

alias clock='tclock -c Yellow'
alias timer='tclock timer -P -d'
alias countdown='tclock countdown -t'
alias chrono='tclock stopwatch'

eval "$(starship init zsh)"
bindkey "^[[3~" delete-char
