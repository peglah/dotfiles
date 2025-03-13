#!/bin/bash

cd /tmp/
wget # https://github.com/sxyazi/yazi/releases/latest
unzip yazi*.zip
sudo cp yazi*/yazi /usr/local/bin/
sudo cp yazi*/completions/yazi.bash /etc/bash_completion.d/
cd -
