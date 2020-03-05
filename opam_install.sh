#! /usr/bin/env bash

OPAM_DIRECTORY=$HOME/mybin
OPAM_ROOT=$HOME/.opam
platform="-x86_64-linux"

# create directory for opam binary (if it doesn't exist)
if [ ! -d $OPAM_DIRECTORY ]; then
    echo "creating target directory for opam..."
    mkdir $OPAM_DIRECTORY
fi

cd $OPAM_DIRECTORY

echo "downloading latest version of opam..."

curl -s https://api.github.com/repos/ocaml/opam/releases/latest |
grep "browser_download_url" |
grep "opam" |
grep -- "-x86_64-linux" |
grep -v ".asc" |
cut -d : -f 2,3 |
tr -d \" |
wget -qi - --show-progress --output-document=opam

chmod +x opam
cd -

# add opam directory to path, if it is not part of it 
if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    echo "opam directory is not in path, adding..."
    echo "# path to directory with addional binaries" >> $HOME/.profile
    echo "PATH=$OPAM_DIRECTORY:\$PATH" >> $HOME/.profile
fi

$OPAM_DIRECTORY/opam init --yes --root $OPAM_ROOT
