#! /usr/bin/env bash

CONFIG_DIR=$HOME/configuration
MYBIN=$HOME/mybin

source _utils.sh

mkdir -p $CONFIG_DIR
git clone https://github.com/michaeldfallen/git-radar $CONFIG_DIR/git-radar


if [ ! -d $MYBIN ]; then
    echo "$MYBIN does NOT exist. creating & adding to PATH"
    create_directory_and_add_to_path $MYBIN 
    ln -s $CONFIG_DIR/git-radar/git-radar $MYBIN/git-radar  
fi

