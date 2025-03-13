#!/bin/bash

set -e
echo "Updating package lists..."
sudo apt update
sudo apt install -y nala git
sudo nala upgrade
echo "System updated."
