#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# mindepth to ignore the dotfiles directory itself
DIRECTORIES=($(find "$SCRIPT_DIR" -mindepth 1 -maxdepth 1 -type d -not -name ".*" -exec basename {} \;))

SUCCESS=true
for dir in "${DIRECTORIES[@]}"; do
    echo "Setting up $dir..."
    stow -R -v "$dir" -t ~/

    if [ $? -ne 0 ]; then
        printf "\tERROR: Stow failed\n"
        SUCCESS=false
    fi
done

if [ "$SUCCESS" = true ]; then
    echo "Setup completed successfully."
else
    echo "Setup completed with errors."
fi