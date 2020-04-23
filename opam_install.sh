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

# this function takes 1 argument - info on latest version available
# this data is in JSON format
get_latest_version_of_opam() {
    cd $OPAM_DIRECTORY

    echo "downloading latest version of opam..."
    
    echo "$1" |
    grep "browser_download_url" |
    grep "opam" |
    grep -- "$platform" |
    grep -v ".asc" |
    cut -d : -f 2,3 |
    tr -d \" |
    wget -qi - --show-progress --output-document=$OPAM_EXEC
    chmod +x $OPAM_EXEC
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
        $OPAM_DIRECTORY/$OPAM_EXEC init --yes --root $OPAM_ROOT
    fi
}

install_opam() {
    create_opam_directory
    get_latest_version_of_opam "$1"
    add_opam_directory_to_path
    run_opam_init
}

get_opam_version() {
    echo "$($OPAM_EXEC --version)"
}

backup_opam() {
    # if backup file already exists remove it
    if [ -f "$OPAM_DIRECTORY/$OPAM_EXEC.baq" ]; then
        rm $OPAM_DIRECTORY/$OPAM_EXEC.baq
    fi
    mv $OPAM_DIRECTORY/$OPAM_EXEC $OPAM_DIRECTORY/$OPAM_EXEC.baq
}


install_or_update_opam() {
    bash _utils.sh require_exec "jq"

    release_info=$(curl -s https://api.github.com/repos/ocaml/opam/releases/latest)
    if bash _utils.sh file_in_path "$OPAM_EXEC"; then
        local_version=$(get_opam_version)
        repo_version=$(bash _utils.sh get_latest_version_from_repo "$release_info")
        # install new version only if repo version is newer than local version
        if [ ! "$local_version" = "$repo_version" ]; then
            backup_opam
            install_opam "$release_info"
        else
            echo "local version is up to date. nothing to do..."
        fi
    else
        install_opam "$release_info"
    fi
}

install_or_update_opam
