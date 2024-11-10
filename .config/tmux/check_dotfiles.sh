#!/bin/bash

REPO_DIR="$HOME/git/Peglah/dotfiles"

cd "$REPO_DIR" || exit

# Run git fetch with a timeout in the background
timeout 10 git fetch origin &
FETCH_PID=$!

# Wait for the fetch process to complete (up to 10 seconds)
wait $FETCH_PID
FETCH_EXIT_CODE=$?

# Check if the fetch was successful (exit code 0 means success)
if [ $FETCH_EXIT_CODE -eq 0 ]; then
  LOCAL_HASH=$(git rev-parse HEAD)
  REMOTE_HASH=$(git rev-parse origin/main)

  if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
    tmux popup -w27 -h4 "echo 'Dotfiles update available'"
  fi
#else
#  echo "git fetch failed or timed out"
fi
