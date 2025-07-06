sudo pacman -Syu --needed gum
mkdir -p ~/YAME/
cp ./* ~/YAME/

echo -e "\n\e[1m\e[96mDo you want to install packages ?\e[0m"
gum confirm && sh ~/YAME/scripts/setup/packages.sh

echo -e "\n\e[1m\e[96mDo you want to install yay ?\e[0m"
gum confirm && sh ~/YAME/scripts/setup/yay.sh

echo -e "\n\e[1m\e[96mDo you want to configure git ?\e[0m"
gum confirm && sh ~/YAME/scripts/setup/git.sh

echo -e "\n\e[1m\e[96mDo you want to clone some repos ?\e[0m"
gum confirm && sh ~/YAME/scripts/setup/repo.sh

echo -e "\n\e[1m\e[96mDo you want to install Lxtharia's minegrub theme ?\e[0m"
gum confirm && sudo sh ~/YAME/scripts/setup/grub.sh

echo -e "\n\e[1m\e[96mDo you want to install ML4W's hyprland dotfiles ?\e[0m"
gum confirm && sh ~/YAME/scripts/setup/hyprland_install.sh

sh ~/YAME/link.sh
