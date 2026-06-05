#!/bin/bash

CONF_FILE="/etc/pacman.conf"

if [[ ! -f "$CONF_FILE" ]]; then
  echo ":: ERROR - $CONF_FILE doesn't exist"
  echo "Press [ENTER] to close."
  read
  exit 1
fi

sudo sed -i 's/^#[[:space:]]*Color/Color/' "$CONF_FILE"

if ! grep -q "^ILoveCandy" "$CONF_FILE"; then
  sudo sed -i '/^Color/a ILoveCandy' "$CONF_FILE"
fi

sudo sed -i 's/^#[[:space:]]*ParallelDownloads/ParallelDownloads/' "$CONF_FILE"
