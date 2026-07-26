sleep 1
clear

echo -e "\e[90m:: Updating system & install \e[1;3;94mgum\e[0m"
sudo pacman -Syu --needed gum

if [ ! -d "$HOME/.yame/" ]; then
  mkdir -p "$HOME/.yame/" &>/dev/null
  git clone https://github.com/YetAnotherMechanicusEnjoyer/dotfiles.git "$HOME"/.yame/
else
  echo -e "\e[90m:: \e[1;93mWARN\e[0;90m - \e[1;3;94m$HOME/.yame/\e[0;90m already exists\e[0m"
  echo -e "\e[0;90m:: Press \e[1;94m[ENTER]\e[0;90m to close.\e[0m"
  read
fi

clear
echo -e "\n\e[1m\e[94mDo you want to configure pacman ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/pacman.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to install packages ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/packages.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to install yay ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/yay.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to configure git ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/git.sh"

echo -e "\n\e[1m\e[94mDo you want to configure tmux ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/tmux.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to clone some repos ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/repo.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to install Lxtharia's minegrub theme ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/grub.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to install Davi-S's minesddm ?\e[0m"
gum confirm && sh "$HOME/.yame/scripts/setup/sddm.sh"

clear
echo -e "\n\e[1m\e[94mDo you want to install other dotfiles ?\e[0m"
action=$(gum choose "ML4W" "end-4" "no")

clear
if [[ $action == "ML4W" ]]; then
  sh "$HOME/.yame/scripts/setup/ml4w_install.sh"
elif [[ $action == "end-4" ]]; then
  bash <(curl -sSf https://ii.clsty.link/get)
fi

clear
sh "$HOME/.yame/link.sh"

clear
