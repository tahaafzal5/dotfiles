#!/bin/bash
set -o errexit
set -o nounset

export BLUE='\033[0;34m'
export RED='\033[0;31m'
export RESET='\033[0m'

debug() {
    echo -e "${BLUE}DEBUG:${RESET} $*"
}

error() {
    echo -e "${RED}ERROR:${RESET} $*" >&2
}

install_homebrew() {
    if ! command -v brew &> /dev/null; then
        debug "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        debug "Homebrew is already installed."
    fi
}

install_dependencies() {
    local dependencies=("stow" "git" "gitk" "git-gui" "tldr" "rsync")
    
    debug "Installing dependencies..."
    for dependency in "${dependencies[@]}"; do
        debug "Installing $dependency..."
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
    debug "Setting up $dir..."
    stow -R -v "$dir" -t ~/

    if [ $? -ne 0 ]; then
        error "ERROR: Stow failed\n"
        SUCCESS=false
    fi
done

if [ "$SUCCESS" = true ]; then
    debug "Setup completed successfully."
else
    debug "Setup completed with errors."
fi
