#! /usr/bin/env bash

OPAM_DIRECTORY=$HOME/mybin
OPAM_ROOT=$HOME/.opam
platform="-x86_64-linux"

create_opam_directory() {
    # create directory for opam binary (if it doesn't exist)
    if [ ! -d $OPAM_DIRECTORY ]; then
        echo "creating target directory for opam..."
        mkdir $OPAM_DIRECTORY
    fi
}

get_latest_version_of_opam() {
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
}

add_opam_directory_to_path() {
    # add opam directory to path, if it is not part of it 
    if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
        echo "opam directory is not in path, adding..."
        echo "# path to directory with addional binaries" >> $HOME/.profile
        echo "PATH=$OPAM_DIRECTORY:\$PATH" >> $HOME/.profile
    fi
}

run_opam_init() {
    # this function should run only if $OPAM_ROOT does NOT exist!
    if [ ! -d $OPAM_ROOT ]; then
        $OPAM_DIRECTORY/opam init --yes --root $OPAM_ROOT
    fi
}

create_opam_directory
get_latest_version_of_opam
add_opam_directory_to_path
run_opam_init
