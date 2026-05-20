#!/usr/bin/env bash
#    ____         __       ____               __     __
#   /  _/__  ___ / /____ _/ / / __ _____  ___/ /__ _/ /____ ___
#  _/ // _ \(_-</ __/ _ `/ / / / // / _ \/ _  / _ `/ __/ -_|_-<
# /___/_//_/___/\__/\_,_/_/_/  \_,_/ .__/\_,_/\_,_/\__/\__/___/
#                                 /_/
#
# I (YetAnotherMechanicusEnjoyer) took this script from Stephan Rabbe's ML4W

# Check if command exists
_checkCommandExists() {
  cmd="$1"
  if ! command -v "$cmd" >/dev/null; then
    echo 1
    return
  fi
  echo 0
  return
}

_isInstalled() {
  package="$1"
  check="$($aur_helper -Qs --color always "${package}" | grep "local" | grep "${package} ")"

  if [ -n "${check}" ]; then
    echo 0
    return
  fi
  echo 1
  return
}

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

sleep 1
clear
if [[ $(_checkCommandExists "figlet") == 0 ]]; then
  figlet -f smslant "Updates"
else
  echo "Updates"
fi

echo
if gum confirm "DO YOU WANT TO START THE UPDATE NOW?"; then
  echo
  echo ":: Update started..."
elif [ $? -eq 130 ]; then
  exit 130
else
  echo
  echo ":: Update canceled."
  exit
fi

# -----------------------------------------------------
# Install update
# -----------------------------------------------------

# Arch
if [[ $(_checkCommandExists "pacman") == 0 ]]; then

  yay_installed="false"
  paru_installed="false"
  if [[ $(_checkCommandExists "yay") == 0 ]]; then
    yay_installed="true"
  fi
  if [[ $(_checkCommandExists "paru") == 0 ]]; then
    paru_installed="true"
  fi
  if [[ $yay_installed == "true" ]] && [[ $paru_installed == "false" ]]; then
    yay
  elif [[ $yay_installed == "false" ]] && [[ $paru_installed == "true" ]]; then
    paru -Syu --noconfirm
  else
    yay
  fi

else
  echo ":: ERROR - Script is made for Arch Linux only"
  echo "Press [ENTER] to close."
  read
fi
echo

# Flatpak
if [[ $(_checkCommandExists "flatpak") == 0 ]]; then
  echo ":: Searching for Flatpak updates..."
  flatpak update
  echo
fi

# Rustup
if [[ $(_checkCommandExists "rustup") == 0 ]]; then
  echo ":: Updating rustup"
  rustup update
  echo
fi

if [[ $(_checkCommandExists "zinit") == 0 ]]; then
  echo ":: Updating zinit"
  zinit self-update
  echo
fi

# Reload Waybar
pkill -RTMIN+1 waybar

# Finishing
echo ":: Update complete! Press [ENTER] to close."
read
