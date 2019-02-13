#! /usr/bin/env bash

user=$(whoami)
home=/home/$user
current_dir=$(pwd)
#echo "home directory is: "
#echo $home
#echo "current directory: "
#echo $current_dir


 sudo ln -s $current_dir/.vimrc 	$home/.vimrc
 sudo ln -s $current_dir/.gitconfig 	$home/.gitconfig
 sudo ln -s $current_dir/.spacemacs 	$home/.spacemacs
 sudo ln -s $current_dir/.tmux.conf	$home/.tmux.conf
 sudo ln -s $current_dir/.Xresources	$home/.Xresources
 sudo ln -s $current_dir/.zprofile	$home/.zprofile
 sudo ln -s $current_dir/zshrc		$home/.zshrc
