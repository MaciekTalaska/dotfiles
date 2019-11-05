#!/usr/bin/env bash

# the idea of this script is to mimic the bahvior of the '--reinstall-packages-from' from the nvm
#
# what this script does is:
# 1) switches to the version that has global packages installed (2nd script argument provided)
# 2) retrieves the list of the packages installed 
# 3) switches to the version of NodeJS that we want to install packages for (1st argument provided)
# 4) installs all the global packages
#
# error codes used:
# 1 - empty version (source or target) specified
# 2 - unable to switch to source version (not installed? misspelled?)
# 3 - unable to switch to target version (not installed? misspelled?)

install_packages() {
  #echo "install packages (entry point)"
  #echo "switch to version "$1
  fnm use $1 >> /dev/null
  if [ $? -ne 0 ]
  then
    exit 3 
  fi

  # by default npm is just too chatty...
  #echo "installing packages"
  #echo "packages..."
  #echo $packages
  #echo "---"

  #npm install -g --silent $2
  npm install -g $2
  #npm install -g --silent `cat testtest.txt`
}

retrieve_packages_names() {
  #echo "retrieve packages..."
  #echo "use version "$2
  fnm use $1 >> /dev/null
  if [ $? -ne 0 ]
  then
    echo ""
    # error code doesn't matter at all, empty string ^ will be returned anyway
    return
  fi

  #packages=$(npm list -g --depth=0 --parseable)
  #asdf_path=$(which fnm| sed 's:/fnm::')
  #full_path="$asdf_path""/node-versions/""$1""/installation/lib/node_modules/"
  #installed_packages=$(echo "$packages" | sed '1d' | sed "s:$full_path::")
  #echo "$installed_packages" > testtest.txt
  #echo "$installed_packages"
  echo `cat testtest.txt`
}

print_usage() {
  echo "Reinstall Node Packages From script"
  echo ""
  echo "Usage:"
  echo "  node_package_reinstall <new version> <old version>"
  echo ""
  echo "Example of usage: "
  echo "  node_package_reinstall 12.10.0 10.16.3"
  echo ""
  echo "  (this installs all global packages from 10.16.3 to 12.10.0)"
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

# NOTE: don't want to use 'set -e' as there will be no control of error code returned

check_for_arguments $1 $2
#echo "calling retrieve_packages_names..."
packages=$(retrieve_packages_names $2)
if [ -z "$packages" ]
then
  exit 2
fi

#echo "calling install..."
install_packages $1 "$packages"
