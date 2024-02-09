#!/bin/bash
set -o errexit
set -o nounset

install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi
}

install_dependencies() {
    local dependencies=("stow" "git" "gitk" "git-gui")
    
    echo "Installing dependencies..."
    for dependency in "${dependencies[@]}"; do
        echo "\tInstalling $dependency..."
        brew install "$dependency"
    done
}

install_homebrew
install_dependencies

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