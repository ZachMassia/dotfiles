#!/bin/bash

cd ~/

# Symlink files
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/Xresources .Xresources

# Symlink dirs
mkdir .i3
cd .i3
lndir ~/.dotfiles/i3/

cd ..
mkdir .vim
cd .vim
lndir ~/.dotfiles/vim
