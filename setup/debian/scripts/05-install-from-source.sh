#!/bin/bash

set -euo pipefail

BUILD_DIR="$(dirname "$(realpath "$0")")/build"

# Ensure the build directory exists
if [[ ! -d "$BUILD_DIR" ]]; then
    echo "Error: Build directory '$BUILD_DIR' does not exist."
    exit 1
fi

# Find all executable scripts in the build directory
SCRIPTS=($(find "$BUILD_DIR" -maxdepth 1 -type f -executable | sort))

# Skip if no scripts are found
if [[ ${#SCRIPTS[@]} -eq 0 ]]; then
    echo "No build scripts found. Skipping."
    exit 0
fi

echo "Executing build scripts from $BUILD_DIR..."
for script in "${SCRIPTS[@]}"; do
    echo "Running $script..."
    "$script"
    echo "Done."
done

echo "All builds completed."
