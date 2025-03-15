#!/bin/bash

set -euo pipefail

cd /tmp

# Get the latest release version tag using GitHub API
latest_version=$(curl -s https://api.github.com/repos/quantumsheep/sshs/releases/latest | jq -r .tag_name)

# Construct the URL for the .deb package
deb_url="https://github.com/quantumsheep/sshs/releases/download/$latest_version/sshs-linux-amd64.deb"

# Output the URL
wget $deb_url
sudo nala install -y ./sshs-linux-amd64.deb
cd -
