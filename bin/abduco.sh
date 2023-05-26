#!/bin/bash

snippet='
if [ -f /usr/local/bin/a4 ]; then
    ABDUCO_CMD=a4
elif [ -f /usr/local/bin/dvtm ]; then
    ABDUCO_CMD=
else
    ABDUCO_CMD=bash
fi'

# Check if "abduco" exists in /etc/environment
if grep -qi "abduco" /etc/environment; then
  echo "ABDUCO_CMD already exists in /etc/environment. Script will not make any changes."
  exit 0
fi

# Append the snippet to /etc/environment
echo "$snippet" | sudo tee -a /etc/environment >/dev/null

echo "ABDUCO_CMD snippet appended to /etc/environment"

