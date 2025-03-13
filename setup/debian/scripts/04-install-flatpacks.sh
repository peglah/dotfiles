#!/bin/bash

set -euo pipefail

FLATPAK_FILE="$(dirname "$(realpath "$0")")/flatpaks.txt"

# Ensure the flatpak list exists
if [[ ! -f "$FLATPAK_FILE" ]]; then
    echo "Error: Flatpak list file '$FLATPAK_FILE' not found."
    exit 1
fi

# Extract package list, ignoring empty lines and comments
FLATPAKS=($(grep -vE '^\s*#|^\s*$' "$FLATPAK_FILE"))

# Skip installation if no valid Flatpaks are listed
if [[ ${#FLATPAKS[@]} -eq 0 ]]; then
    echo "No Flatpaks to install. Skipping Flatpak setup."
    exit 0
fi

# Ensure Flatpak is installed
if ! command -v flatpak &>/dev/null; then
    echo "Flatpak not found. Installing..."
    sudo nala update
    sudo nala install -y flatpak
fi

# Add Flathub if not already added
if ! flatpak remote-list | grep -q flathub; then
    echo "Adding Flathub repository..."
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

echo "Installing Flatpaks from $FLATPAK_FILE..."
sudo flatpak install -y flathub "${FLATPAKS[@]}"

echo "Flatpak installation complete."
