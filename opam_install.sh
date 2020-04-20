#! /usr/bin/env bash

OPAM_DIRECTORY=$HOME/mybin
OPAM_ROOT=$HOME/.opam
OPAM_EXEC=opam
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
    if [[ ":$PATH:" != *":$OPAM_DIRECTORY:"* ]]; then
        echo "opam directory is not in path, adding..."
        echo "# path to directory with additional binaries" >> $HOME/.profile
        echo "PATH=$OPAM_DIRECTORY:\$PATH" >> $HOME/.profile
    fi
}

run_opam_init() {
    # this function should run only if $OPAM_ROOT does NOT exist!
    if [ ! -d $OPAM_ROOT ]; then
        $OPAM_DIRECTORY/opam init --yes --root $OPAM_ROOT
    fi
}

install_opam() {
    create_opam_directory
    get_latest_version_of_opam
    add_opam_directory_to_path
    run_opam_init
}

get_opam_version() {
    echo "$($OPAM_EXEC --version)"
}

backup_opam() {
    # if backup file already exists remove it
    if [ -f "$OPAM_DIRECTORY/opam.baq" ]; then
        rm $OPAM_DIRECTORY/opam.baq
    fi
    mv $OPAM_DIRECTORY/opam $OPAM_DIRECTORY/opam.baq
}


bash _utils.sh require_exec "jq"

if bash _utils.sh file_in_path "$OPAM_EXEC"; then
    # "$OPAM_EXEC exists"
    # 1. get version of opam currently installed
    local_version=$(get_opam_version)
    # 2. get latest version from repository
    result=$(curl -s https://api.github.com/repos/ocaml/opam/releases/latest)
    repo_version=$(bash _utils.sh get_latest_version_from_repo "$result")
    # 3. install new version only if repo version is newer than local version
    if [ ! "$local_version" = "$repo_version" ]; then
        # 1. backup old version
        backup_opam
        # 2. install new version
        install_opam
    else
        echo "local version is up to date. nothing to do..."
    fi
else
    # no $OPAM_EXEC in path, so install it
    install_opam
fi

