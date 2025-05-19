sudo pacman -Syu --needed gum

echo -e "\n\e[1m\e[96mDo you want to install packages ?\e[0m"
gum confirm && sh ./scripts/setup/packages.sh

echo -e "\n\e[1m\e[96mDo you want to install yay ?\e[0m"
gum confirm && sh ./scripts/setup/yay.sh

echo -e "\n\e[1m\e[96mDo you want to configure git ?\e[0m"
gum confirm && sh ./scripts/setup/git.sh

echo -e "\n\e[1m\e[96mDo you want to clone some repos ?\e[0m"
gum confirm && sh ./scripts/setup/repo.sh

echo -e "\n\e[1m\e[96mDo you want to install ML4W's hyprland dotfiles ?\e[0m"
gum confirm && sh ./scripts/setup/hyprland_install.sh
