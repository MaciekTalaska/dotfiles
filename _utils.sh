#! /usr/bin/env bash

# require_exec - this function checks if specified executable 
# is available for the current user on the system
# if not - exits script immediatelly
# argument: executable name
require_exec() {
  if ! bash _utils.sh file_in_path "$1"; then
    echo "error: $1 is required. aborting script..."
    exit 1;
  fi
}

clean_font_cache() {
  echo "clean font cache... (this may take a while)"
  fc-cache -f
}

# file_in_path - checks if specified executable
# is available for the current user on the system
# argument: executable name
file_in_path() {
  if command -v $1 >/dev/null 2>&1; then
    return 0 
  else 
    return 1
  fi
}

# get info on the latest version available in github repository
# argument: json document from github repo
get_latest_version_from_repo() {
  version=$(echo "$1" | jq -r '.tag_name')
  echo "$version"
}

# create_directory_and_add_to_path
# creates directory (if not exists) and adds it to path (.profile)
# arguments:
# $1 - directory to be created and added to $PATH
create_directory_and_add_to_path() {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        echo "# path to directory with additional binaries" >> $HOME/.profile
        echo "PATH=$1:\$PATH" >> $HOME/.profile
    fi
    echo "PATH has been modified. logout & login for the changes to take effect."
}

"$@"
