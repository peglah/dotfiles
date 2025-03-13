#!/bin/bash

sudo nala install -y cmake pkg-config

git clone https://github.com/fastfetch-cli/fastfetch /tmp/fastfetch
mkdir -p /tmp/fastfetch/build
cd /tmp/fastfetch/build
cmake ..
cmake --build . --target fastfetch
sudo cp fastfetch /usr/local/bin/
cd -
