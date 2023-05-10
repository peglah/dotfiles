#!/bin/bash

# Get the list of available versions and sort it in ascending order
versions=$(curl -s https://dl.suckless.org/dwm/ | grep -Eo 'href="[^\"]+"' | cut -d'"' -f2 | grep '^dwm-.*\.tar\.gz$' | sort -r)

# Convert the list of available versions to an array
readarray -t versions_array <<< "$versions"

# Display a numbered list of available versions
echo "Available versions:"
for i in $(seq 0 $((${#versions_array[@]}-1)) | tac); do
	  echo "$i. ${versions_array[$i]}"
  done

  # Prompt the user to choose a version
  read -p "Choose a version to download (0-$(( ${#versions_array[@]} - 1 ))): " choice

  # Validate the user's choice
  if ! (( choice >= 0 && choice <= $((${#versions_array[@]} - 1)) )); then
	    echo "Invalid choice: $choice"
	      exit 1
  fi

  # Get the URL of the selected version
  selected_version=${versions_array[$choice]}
  selected_url="https://dl.suckless.org/dwm/$selected_version"

  # Download the selected version
  curl -O "$selected_url"

  # Extract the contents of the downloaded tarball
  tar -xzf "$selected_version"
  
  # Remove the tarball
  rm "$selected_version"
