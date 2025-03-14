#!/bin/bash

git clone --depth 1 https://github.com/joehillen/sysz.git /tmp/sysz
cd /tmp/sysz
sudo make install
cd -
