#!/bin/bash
set -e
echo "Setting up system preferences..."

sudo systemctl mask sleep.target
sudo systemctl mask suspend.target
sudo systemctl mask hibernate.target
sudo systemctl mask hybrid-sleep.target

echo "System configured."
