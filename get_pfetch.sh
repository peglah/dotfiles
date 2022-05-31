#!/bin/sh

FILE=/usr/local/bin/pfetch
if [ -f "$FILE" ]; then
  echo "$FILE already exists."
else
  echo "$FILE does not exist."

  curl -L -O https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
  sudo chmod +x pfetch
  sudo mv pfetch /usr/local/bin/

fi

echo "Please run: echo pfetch >> ~/.bashrc"
