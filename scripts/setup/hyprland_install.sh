#!/bin/bash

set -e

mkdir -p ~/ML4W/
git clone https://github.com/mylinuxforwork/dotfiles.git ~/ML4W/dotfiles/
sh ~/ML4W/dotfiles/setup-arch.sh
