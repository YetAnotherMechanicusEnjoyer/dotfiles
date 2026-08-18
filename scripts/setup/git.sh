#!/usr/bin/env bash

set -e

email=$(gum input --placeholder "Enter your github email")
username=$(gum input --placeholder "Enter your github username")

git config --global user.email "$email"
git config --global user.name "$username"
