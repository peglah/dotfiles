#!/bin/bash

set -euo pipefail

set -e
echo "Updating package lists..."
sudo nala upgrade -y
echo "System updated."
