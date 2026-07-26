#!/bin/bash

CONF_FILE="/etc/pacman.conf"

if [[ ! -f "$CONF_FILE" ]]; then
  echo -e "\e[90m:: \e[1;91mERROR\e[0;90m - \e[1;3;94m$CONF_FILE\e[0;90m doesn't exist\e[0m"
  echo -e "\e[0;90m:: Press \e[1;94m[ENTER]\e[0;90m to close.\e[0m"
  read
  exit 1
fi

sudo sed -i 's/^#[[:space:]]*Color/Color/' "$CONF_FILE"

if ! grep -q "^ILoveCandy" "$CONF_FILE"; then
  sudo sed -i '/^Color/a ILoveCandy' "$CONF_FILE"
fi

sudo sed -i 's/^#[[:space:]]*ParallelDownloads/ParallelDownloads/' "$CONF_FILE"
