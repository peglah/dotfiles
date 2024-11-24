#!/bin/bash

while [[ true ]]; do
  wtwitch c | sed '/Settings:/,$d' | awk 'NF' > /tmp/.wtwitch

  UPTIME=$(uptime | \
    sed 's/\(.*\),\s*[0-9]\+ user[s]*\(.*\)/\1\2/' | \
    sed 's/load average:/load:/')

  clear
  echo $UPTIME | cut -c -45
  echo
  cat /tmp/.wtwitch

  sleep 60
done
