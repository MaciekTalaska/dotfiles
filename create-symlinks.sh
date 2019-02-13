#! /usr/bin/env bash

user=$(whoami)
home=/home/$user
current_dir=$(pwd)

files=('.bashrc' 
        '.vimrc' 
        '.gitconfig' 
        '.spacemacs' 
        '.tmux.conf' 
        '.Xresources' 
        '.zprofile' 
        '.zshrc')

create_symlinks() {
    for file in "${files[@]}"
    do
        sudo ln -s $current_dir/$file $home/$file
    done
}

remove_symlinks() {
    for file in "${files[@]}"
    do
        rm $home/$file
    done
}

if [ "$1" = "-u" ];
then
    remove_symlinks
else
    create_symlinks
fi
