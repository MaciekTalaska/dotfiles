#!/usr/bin/env bash

# Perforce download site:
# http://filehost.perforce.com/perforce/

install() {
    pushd -n $(pwd)

    local fullpath=~/apps/p4v
    local baqpath=~/apps/p4v-baq
    local appsdirectory=~/apps

    create_destination_directory

    cd ~/apps/p4v

    download_p4merge_archive
    
    extract_p4merge

    create_symlink
    popd
}

create_destination_directory() {
    if [ -d ~/apps/p4v-baq ]; then
        rm ~/apps/p4v-baq -rf
    fi

    # backup old p4v installation (if exists)
    if [ -d ~/apps/p4v ]; then
        mv ~/apps/p4v ~/apps/p4v-baq
    fi

    if [ ! -d ~/apps ]; then
        mkdir ~/apps/p4v
    fi

    if [ ! -d ~/apps/p4v ]; then
        mkdir ~/apps/p4v
    fi
}

create_symlink() {
    if [ -f /usr/local/bin/p4merge ]; then
        sudo rm /usr/local/bin/p4merge
    fi

    sudo ln -s $(realpath bin/p4merge) /usr/local/bin/p4merge
}

download_p4merge_archive() {
    version=$(get_latest_version_info)
    wget -O p4v.tgz http://filehost.perforce.com/perforce/${version}/bin.linux26x86_64/p4v.tgz
}

get_latest_version_info() {
    local content=$(curl -s http://filehost.perforce.com/perforce/)
    local lines=$(awk '/>r/{print $5,$6}' <<< "$content")
    local entries=$(sed -e 's/href="\(r.\{4\}\).*/\1/' <<< "$lines")
    #for some reason there are no binaries for 18.5
    #local latest=$(tail -n1 <<< "$versions")
    local versions=$(sed '/robot/d' <<< "$entries")
    local latest=$(tail -2 <<< "$versions" | head -1)
    echo $latest
}

extract_p4merge() {
    tar -xf p4v.tgz --strip 1
    rm p4v.tgz 
}

install
