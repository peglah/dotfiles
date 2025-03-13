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

local srclist="/etc/apt/sources.list"
if ! grep -q contrib "${srclist}"; then
  echo "Enabling contrib repos."
  sudo sed -i \
    '/deb/{/ contrib\(\ \|$\)/! s/$/ contrib/}' "${srclist}"
    else
      echo "contrib already enabled."
fi

local srclist="/etc/apt/sources.list"
if ! grep -q non-free-firmware "${srclist}"; then
  echo "Enabling non-free-firmware repos."
  sudo sed -i \
    '/deb/{/ non-free-firmware\(\ \|$\)/! s/$/ non-free-firmware/}' "${srclist}"
    else
      echo "non-free-firmware already enabled."
fi

local srclist="/etc/apt/sources.list"
if ! grep -q 'non-free\( \|$\)' "${srclist}"; then
  echo "Enabling non-free repos."
  sudo sed -i \
    '/deb/{/ non-free\(\ \|$\)/! s/$/ non-free/}' "${srclist}"
    else
      echo "non-free already enabled."
fi

echo "Installing: ${PACKAGES[*]}"
sudo nala update
sudo nala install -y "${PACKAGES[@]}"

echo "Package installation complete."
