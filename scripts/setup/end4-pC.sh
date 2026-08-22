#!/usr/bin/env bash

pC_config="$HOME/.config/quickshell/end4-pC"

[ ! -d "$pC_config" ] && git clone "https://github.com/pctrade/end4-pC.git" "$pC_config"
