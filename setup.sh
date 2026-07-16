sleep 1
clear
sudo pacman -Syu --needed gum
mkdir -p "$HOME/.yame/" &>/dev/null
cp -r ./* "$HOME/.yame/"
cp ./.tokens "$HOME/.yame/.tokens" &>/dev/null

clear
echo -e "\n\e[1m\e[96mDo you want to configure pacman ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/pacman.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to install packages ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/packages.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to install yay ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/yay.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to configure git ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/git.sh"

echo -e "\n\e[1m\e[96mDo you want to configure tmux ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/tmux.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to clone some repos ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/repo.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to install Lxtharia's minegrub theme ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/grub.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to install Davi-S's minesddm ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/sddm.sh"

clear
echo -e "\n\e[1m\e[96mDo you want to install other dotfiles ?\e[0m"
action=$(gum choose "ML4W" "end-4" "no")

clear
if [[ $action == "ML4W" ]]; then
  sh "$HOME/.yame/scripts/setup/ml4w_install.sh"
elif [[ $action == "end-4" ]]; then
  bash <(curl -s https://ii.clsty.link/get)
fi

clear
sh "$HOME/.yame/link.sh"
