#!/bin/bash
set -euo pipefail

sudo nala install -y stow

# Ensure ~/.config exists before moving files
if [[ -d "$HOME/.config" && -n "$(ls -A "$HOME/.config")" ]]; then
    shopt -s dotglob  # Include hidden files

    for file in "$HOME/.config/"*; do
        target="$HOME/git/Peglah/dotfiles/.config/$(basename "$file")"

        if [[ -e "$target" ]]; then
            echo "Skipping $file → Already exists in dotfiles"
        else
            mv "$file" "$target"
        fi
    done

    rmdir "$HOME/.config" 2>/dev/null || true
else
    echo "Warning: ~/.config is empty or does not exist. Skipping move."
fi

cd "$HOME/git/Peglah/dotfiles"
stow . -t "$HOME"

# Ensure ~/.local/bin is a symlink to dotfiles
if [[ -e "$HOME/.local/bin" || -L "$HOME/.local/bin" ]]; then
    rm -rf "$HOME/.local/bin"
fi

ln -s "$HOME/git/Peglah/dotfiles/.local/bin" "$HOME/.local/bin"

cd -

mv "$HOME/.bash_profile" "$HOME/.bashrc"
