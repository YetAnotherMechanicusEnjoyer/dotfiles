sudo pacman -Syu
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay || exit 1
makepkg -si
cd ~/ || exit 1
sudo pacman -S \
  zsh \
  fzf \
  eza \
  zoxide \
  starship \
  valgrind \
  neovim \
  lazygit \
  vim \
  nano \
  fastfetch \
  criterion \
  tmux \
  discord \
  bear \
  ghostty

git clone https://github.com/YetAnotherMechanicusEnjoyer/template.git
