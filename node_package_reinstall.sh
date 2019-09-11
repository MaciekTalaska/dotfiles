#!/usr/bin/env bash

retrieve_packages_names() {
	asdf global nodejs $1
  packages=$(npm list -g --depth=0 --parseable)
  #packages=$(cat npm_packages.txt)
	asdf_path=$(which asdf | sed 's:/bin/asdf::')
	full_path="$asdf_path""/installs/nodejs/""$1""/.npm/lib/node_modules/"
	installed_packages=$(echo "$packages" | sed '1d' | sed "s:$full_path::")
	echo "$installed_packages"
}

install_packages() {
	asdf global nodejs $1
  npm install -g $2
}

print_usage() {
  echo "this script requires two NodeJS versions to be specified"
  echo "the new version just recently installed (target)"
  echo "and the old version, with some packages already installed (source)"
  echo ""
  echo "Example of usage: "
  echo "node_package_reinstall 12.10.0 10.16.3"
  echo ""
  echo "this will install all global packages from 10.16.3 to 12.10.0"
}

check_for_arguments() {
  if [ -z "$1" ]
  then
    print_usage
    exit 1
  fi

  if [ -z "$2" ]
  then
    print_usage
    exit 1
  fi
}


check_for_arguments $1 $2
packages=$(retrieve_packages_names $2)

install_packages $1 "$packages"
