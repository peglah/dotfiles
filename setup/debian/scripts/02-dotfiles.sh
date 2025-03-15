#!/bin/bash
set -euo pipefail

sudo nala install -y stow

# Ensure ~/.config exists before moving files
if [[ -d "$HOME/.config" && -n "$(ls -A "$HOME/.config")" ]]; then
    shopt -s dotglob  # Include hidden files
    mv "$HOME/.config/"* "$HOME/git/Peglah/dotfiles/.config/"
    rmdir "$HOME/.config"
else
    echo "Warning: ~/.config is empty or does not exist. Skipping move."
fi

cd "$HOME/git/Peglah/dotfiles"
stow . -t "$HOME"

ln -s "$HOME/git/Peglah/dotfiles/.local/bin/" "$HOME/.local/bin"

cd -

mv "$HOME/.bash_profile" "$HOME/.bashrc"

source "$HOME/.profile"
