#!/bin/bash

set -e

email=$(gum input --placeholder "Enter your github email")
username=$(gum input --placeholder "Enter your github username")

git config --global user.email "$email"
git config --global user.name "$username"

echo -e "\n\e[1m\e[96mDo you want to generate an ssh key ?\e[0m"
gum confirm && echo || exit
ssh-keygen -t rsa -b 4096 -C "$email"
echo
cat ~/.ssh/id_rsa.pub
echo -e "\n\e[1m\e[96mPaste the key into github and THEN confirm\e[0m"

gum confirm && echo "I hope you did" || echo "Well do it as soon as possible"
