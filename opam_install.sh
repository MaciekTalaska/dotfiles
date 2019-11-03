#! /usr/bin/env bash

OPAM_DIRECTORY=$HOME/.opam-bin
OPAM_ROOT=$HOME/.opam
platform="-x86_64-linux"

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

#if [[ $PATH == ?(*:)$HOME/bin?(:*) ]]; then
if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    echo "opam directory is not in path, adding..."
    export PATH=$OPAM_DIRECTORY:$PATH
fi

opam init --yes --root $OPAM_DIRECTORY
