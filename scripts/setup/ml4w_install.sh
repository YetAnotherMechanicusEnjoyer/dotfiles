#!/bin/bash

set -e

if [ ! -d "$HOME/ml4w-dotfiles" ]; then
  git clone https://github.com/mylinuxforwork/dotfiles.git ~/ml4w-dotfiles/
  sh ~/ML4W/dotfiles/setup/setup-arch.sh
fi
