#!/usr/bin/env bash

cd
mkdir configuration
cd configuration
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
cd ..

git clone https://github.com/michaeldfallen/git-radar
cd ..
