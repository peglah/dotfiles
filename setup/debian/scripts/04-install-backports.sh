#!/bin/bash

set -euo pipefail

BACKPORT_FILE="$(dirname "$(realpath "$0")")/backports.txt"

# Ensure the package list exists
if [[ ! -f "$BACKPORT_FILE" ]]; then
    echo "Error: Backport list file '$BACKPORT_FILE' not found."
    exit 1
fi

echo "Installing backports from $BACKPORT_FILE..."

# Read package names, remove comments and empty lines, then install
BACKPORTS=($(grep -vE '^\s*#|^\s*$' "$BACKPORT_FILE"))

if [[ ${#BACKPORTS[@]} -eq 0 ]]; then
    echo "No backports to install."
    exit 0
fi

if [ ! -f "/etc/apt/sources.list.d/bookworm-backports.list" ]; then
    echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware" | sudo tee "/etc/apt/sources.list.d/bookworm-backports.list"
fi

echo "Installing: ${BACKPORTS[*]}"
sudo nala update
sudo apt install -y "${BACKPORTS[@]}"

echo "Backport installation complete."
