sudo pacman -Syu
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay || exit 1
makepkg -si
cd - || exit 1
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
  cmake \
  discord \
  bear \
  gum \
  docker \
  mariadb \
  openssh \
  ghostty

sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl start docker
sudo systemctl enable docker

echo -e "\n\e[1m\e[96mDo you want to configure git & clone some repos ?\e[0m"
gum confirm && echo || exit

email=$(gum input --placeholder "Enter your github email")
username=$(gum input --placeholder "Enter your github username")

git config --global user.email "$email"
git config --global user.name "$username"

ssh-keygen -t rsa -b 4096 -C "$email"
echo
cat ~/.ssh/id_rsa.pub
echo -e "\n\e[1m\e[96mPaste the key into github and THEN confirm\e[0m"

gum confirm && echo "I hope you did" || echo "Well do it as soon as possible"
gum spin --spinner jump --title "Waiting a bit in case you missclicked." -- sleep 10

echo -e "\n\e[1m\e[96mDo you want to clone some repos ?\e[0m"
gum confirm && echo || exit

if [ "$username" == "YetAnotherMechanicusEnjoyer" ]; then
  git clone git@github.com:YetAnotherMechanicusEnjoyer/template.git ~/template
  git clone git@github.com:YetAnotherMechanicusEnjoyer/discord-autoupdater.git ./scripts/discord
else
  git clone https://github.com/YetAnotherMechanicusEnjoyer/template.git ~/template
  git clone https://github.com/YetAnotherMechanicusEnjoyer/discord-autoupdater.git ./scripts/discord
fi
