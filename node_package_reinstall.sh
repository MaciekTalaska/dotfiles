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

packages=$(retrieve_packages_names $2)

install_packages $1 "$packages"
