#!/usr/bin/env bash

# Perforce download site:
# http://filehost.perforce.com/perforce/

pushd -n $(pwd)

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

cd ~/apps/p4v

# TODO: instead of hard-coded url for a specific version
# it would be best to get info on the newest version availablev
wget -O p4v.tgz http://filehost.perforce.com/perforce/r18.2/bin.linux26x86_64/p4v.tgz

tar -xf p4v.tgz --strip 1

rm p4v.tgz 

if [ -f /usr/local/bin/p4merge ]; then
    sudo rm /usr/local/bin/p4merge
fi

sudo ln -s $(realpath bin/p4merge) /usr/local/bin/p4merge
popd
