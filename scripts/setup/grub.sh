#!/usr/bin/env bash

set -e

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

git clone "https://github.com/Lxtharia/double-minegrub-menu.git" "grub"

sudo sh "./grub/install.sh"
sudo os-prober
sudo grub-mkconfig -o "/boot/grub/grub.cfg"

cd - >/dev/null
rm -rf "$TMPDIR"
