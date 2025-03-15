#!/bin/bash

set -euo pipefail

# Deps, Ueberzug++
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
sudo nala update
sudo nala install -y ueberzugpp

cd /tmp

# Get the latest release version tag using GitHub API
latest_version=$(curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | jq -r .tag_name)

# Construct the URL for the .deb package
deb_url="https://github.com/sxyazi/yazi/releases/download/$latest_version/yazi-x86_64-unknown-linux-musl.zip"

# Output the URL
wget $deb_url

unzip yazi-x86_64-unknown-linux-musl.zip
sudo cp yazi-x86_64-unknown-linux-musl/yazi /usr/local/bin/
sudo cp yazi-x86_64-unknown-linux-musl/completions/yazi.bash /etc/bash_completion.d/

cd -
