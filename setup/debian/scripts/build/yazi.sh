#!/bin/bash

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
