#!/bin/bash

set -euo pipefail

cd /tmp

# Get the latest release version tag using GitHub API for gitmux
latest_version=$(curl -s https://api.github.com/repos/arl/gitmux/releases/latest | jq -r .tag_name)

# Construct the URL for the .tar.gz package
tar_url="https://github.com/arl/gitmux/releases/download/$latest_version/gitmux_${latest_version}_linux_amd64.tar.gz"

# Output the URL and download the tarball
wget $tar_url
mkdir -p /tmp/gitmux
tar -xvzf gitmux_${latest_version}_linux_amd64.tar.gz -C /tmp/gitmux
sudo cp /tmp/gitmux/gitmux /usr/local/bin/
cd -
