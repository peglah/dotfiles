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

if ! grep -q contrib "/etc/apt/sources.list"; then
  echo "Enabling contrib repos."
  sudo sed -i \
    '/deb/{/ contrib\(\ \|$\)/! s/$/ contrib/}' "/etc/apt/sources.list"
    else
      echo "contrib already enabled."
fi

if ! grep -q non-free-firmware "/etc/apt/sources.list"; then
  echo "Enabling non-free-firmware repos."
  sudo sed -i \
    '/deb/{/ non-free-firmware\(\ \|$\)/! s/$/ non-free-firmware/}' "/etc/apt/sources.list"
    else
      echo "non-free-firmware already enabled."
fi

if ! grep -q 'non-free\( \|$\)' "/etc/apt/sources.list"; then
  echo "Enabling non-free repos."
  sudo sed -i \
    '/deb/{/ non-free\(\ \|$\)/! s/$/ non-free/}' "/etc/apt/sources.list"
    else
      echo "non-free already enabled."
fi

echo "Installing: ${PACKAGES[*]}"
sudo nala update
sudo nala install -y "${PACKAGES[@]}"

echo "Package installation complete."
