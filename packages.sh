sudo pacman -Syu
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~/
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
discord \


git clone https://github.com/YetAnotherMechanicusEnjoyer/template.git
