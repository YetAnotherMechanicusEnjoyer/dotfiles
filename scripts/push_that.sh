# Commit
TYPE=$(gum choose "ADD" "EDIT" "FIX" "REMOVE" "UPDATE" "MERGE")
TITLE=$(gum input --value "[$TYPE] " --placeholder "Title")
DESCRIPTION=$(gum write --placeholder "Commit description")

echo -e "\e[1m\e[92mTitle : $TITLE\nDescription : $DESCRIPTION"
gum confirm "Commit changes ?" && git commit -m "$TITLE" -m "$DESCRIPTION"
