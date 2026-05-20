#!/bin/bash

CONF_FILE="/etc/pacman.conf"

if [[ ! -f "$CONF_FILE" ]]; then
  echo ":: ERROR - $CONF_FILE doesn't exist"
  echo "Press [ENTER] to close."
  read
  exit 1
fi

sudo sed -i 's/#Color/Color/g' "$CONF_FILE"
echo "ILoveCandy" | sudo tee -a "$CONF_FILE"
