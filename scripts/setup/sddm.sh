#!/usr/bin/env bash

set -e

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

git clone "https://github.com/Davi-S/sddm-theme-minesddm.git" "sddm"

sudo cp -r "./sddm/minesddm" "/usr/share/sddm/themes/"
sudo sed -i '/^\[Theme\]/,/^\[/ s/^Current=.*/Current=minesddm/' "/usr/lib/sddm/sddm.conf.d/default.conf"

cd - >/dev/null
rm -rf "$TMPDIR"
