sudo pacman -Syu
sudo pacman -S --needed base-devel gi
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
sudo pacman -S \
zsh \
fzf \
eza \
zoxide \
starship \
valgrind \
neovim \
vim \
nano \
emacs \
fastfetch \
criterion \
tmux \
