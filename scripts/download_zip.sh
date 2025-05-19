#!/bin/bash

set -e

DOWNLOAD=$1
INSTALL_PATH=$2

if [ "$DOWNLOAD" == "" ] || [ "$INSTALL_PATH" == "" ]; then
  gum log --structured --level error "Bad Usage" usage "./download_zip.sh <link> <path>"
  exit 1
fi

if [ -d "$INSTALL_PATH" ] || [ -f "$INSTALL_PATH" ]; then
  gum log --structured --level warn "File or directory already exists. Installation aborted." path "$INSTALL_PATH"
  exit
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

wget -t 5 -q -O "download.zip" --show-progress "DOWNLOAD"

unzip "download.zip" -d "$INSTALL_PATH"

cd - >/dev/null
rm -rf "$TMPDIR"
