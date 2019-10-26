#!/bin/bash

# you should re-run this script only after a new file has been added under current directory

dir="dotfiles"
files="bashrc vimrc bash_profile face.icon conkyrc gitconfig"


#cd $dir
dir=$(pwd)

for file in $files; do
    if ! [ -L ~/.$file ] ; then
        rm ~/.$file
        echo "Creating link ~/.$file -> $dir/$file"
        ln -sv $dir/$file ~/.$file
    fi
done

