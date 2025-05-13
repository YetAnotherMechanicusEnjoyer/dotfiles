#!/bin/bash

set -e

# Add
gum confirm "Did you git add files ?" && printf "" || exit

# Commit
TYPE=$(gum choose "ADD" "EDIT" "FIX" "REMOVE" "UPDATE" "MERGE")
TITLE=$(gum input --value "[$TYPE] " --placeholder "Title")
DESCRIPTION=$(gum write --placeholder "Commit description")

if [ "$DESCRIPTION" == "" ]; then
  DESC="<no description>"
else
  DESC="$DESCRIPTION"
fi

echo -e "\e[1m\e[95m\e[4mTitle :\e[0m \e[1m\e[97m$TITLE\n\e[4m\e[95mDescription :\e[0m \e[90m\e[1m$DESC\e[0m"

gum confirm "Commit changes ?" && git commit -m "$TITLE" -m "$DESCRIPTION"

# Push
gum confirm "Push commits ?" && git push
