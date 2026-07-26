#!/usr/bin/env bash

set -e

email=$(gum input --placeholder "Enter your github email")
username=$(gum input --placeholder "Enter your github username")

git config --global user.email "$email"
git config --global user.name "$username"

echo -e "\n\e[0;90mDo you want to generate an ssh key ?\e[0m"
gum confirm && echo || exit
ssh-keygen -t rsa -b 4096 -C "$email"
echo

cat ~/.ssh/id_rsa.pub

echo -e "\n\e[0;90mThis is your \e[3;94mpublic key\e[0;90m, you can copy it.\e[0m"
echo -e "\e[0;90m:: Press \e[1;94m[ENTER]\e[0;90m to continue.\e[0m"
read
