#!/bin/bash

set -euo pipefail

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"

# Ensure the package list exists
if [[ ! -f "$PACKAGE_FILE" ]]; then
    echo "Error: Package list file '$PACKAGE_FILE' not found."
    exit 1
fi

echo "Installing packages from $PACKAGE_FILE..."

# Read package names, remove comments and empty lines, then install
PACKAGES=($(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE"))

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
    echo "No packages to install."
    exit 0
fi

sudo add-apt-repository -y contrib
sudo add-apt-repository -y non-free
sudo add-apt-repository -y non-free-firmware

echo "Installing: ${PACKAGES[*]}"
sudo nala update
sudo nala install -y "${PACKAGES[@]}"

if command -v tldr &> /dev/null; then
  tldr --update
fi

echo "Package installation complete."
