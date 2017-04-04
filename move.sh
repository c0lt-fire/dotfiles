#!/bin/bash

dir="dotfiles"
files="conkyrc bashrc vimrc"


#cd $dir

for file in $files; do
    if ! [ -L ~/.$file ] ; then
        echo "Moving .$file to $dir"
        mv ~/.$file ~/$dir/$file
        echo "Creating link ~/.$file -> ~/$dir/$file"
        ln -s ~/$dir/$file ~/.$file
    fi
done

