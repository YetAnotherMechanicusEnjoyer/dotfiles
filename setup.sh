sudo pacman -Syu --needed gum
mkdir -p ~/.yame/ &>/dev/null
cp -r ./* ~/.yame/
cp ./.tokens ~/.yame/.tokens &>/dev/null

echo -e "\n\e[1m\e[96mDo you want to install packages ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/packages.sh

echo -e "\n\e[1m\e[96mDo you want to install yay ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/yay.sh

echo -e "\n\e[1m\e[96mDo you want to configure git ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/git.sh

echo -e "\n\e[1m\e[96mDo you want to clone some repos ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/repo.sh

echo -e "\n\e[1m\e[96mDo you want to install Lxtharia's minegrub theme ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/grub.sh

echo -e "\n\e[1m\e[96mDo you want to install Davi-S's minesddm ?\e[0m"
gum confirm && sh ~/.yame/scripts/setup/sddm.sh

echo -e "\n\e[1m\e[96mDo you want to install other dotfiles ?\e[0m"
action=$(gum choose "ML4W" "end-4" "no")

if [[ $action == "ML4W" ]]; then
  sh ~/.yame/scripts/setup/ml4w_install.sh
elif [[ $action == "end-4" ]]; then
  bash <(curl -s https://ii.clsty.link/get)
fi

sh ~/.yame/link.sh
