#!/bin/bash

set -euo pipefail

SCRIPTS_DIR="$(dirname "$(realpath "$0")")/scripts"
USER_NAME="$(whoami)"

# Prevent running as root
if [[ "$USER_NAME" == "root" ]]; then
    echo "Error: Do not run this script as root. Use a normal user with sudo access."
    exit 1
fi

# Check if sudo works
if ! sudo -v 2>/dev/null; then
    echo "Error: User '$USER_NAME' does not have sudo access."
    echo "To fix this, switch to root and run:"
    echo "    usermod -aG sudo $USER_NAME"
    echo "Then log out and log back in."
    exit 1
fi

echo "User '$USER_NAME' has sudo access."

# Ensure the scripts directory exists
if [[ ! -d "$SCRIPTS_DIR" ]]; then
    echo "Error: Directory $SCRIPTS_DIR does not exist."
    exit 1
fi

# Find and execute scripts in order
SCRIPTS=($(find "$SCRIPTS_DIR" -maxdepth 1 -type f -executable | sort))

if [[ ${#SCRIPTS[@]} -eq 0 ]]; then
    echo "No executable scripts found in $SCRIPTS_DIR."
    exit 1
fi

echo "Executing scripts in $SCRIPTS_DIR..."
for script in "${SCRIPTS[@]}"; do
    echo "Running $script..."
    "$script"
    echo "Done."
done

echo "All scripts executed successfully."
