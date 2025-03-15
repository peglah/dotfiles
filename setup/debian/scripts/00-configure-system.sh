#!/bin/bash

set -euo pipefail

echo "Setting up system preferences..."

sudo systemctl mask sleep.target
sudo systemctl mask suspend.target
sudo systemctl mask hibernate.target
sudo systemctl mask hybrid-sleep.target

# Customize sudo to insult incorrect password attempts
if ! sudo grep -q "^Defaults\s\+insults" /etc/sudoers; then
  echo "Enabling sudo insults."
  sudo sh -c \
    'sed -e "/^Defaults\tsecure_path/a Defaults\tinsults" /etc/sudoers |
    EDITOR="tee -p" visudo > /dev/null'
    else
      echo "Insults already enabled, you masochist."
fi

echo "System configured."
