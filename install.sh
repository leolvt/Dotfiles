#!/bin/bash

echo "Installing Bash config files (bashrc, bash_login, bash_logout)"
ln -s $PWD/bash_login ~/.bash_login
ln -s $PWD/bash_logout ~/.bash_logout
ln -s $PWD/bashrc ~/.bashrc
echo "Installing Git config files (gitconfig, gitignore-global)"
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore-global ~/.gitignore-global
echo "Installing custom login files"
ln -s $PWD/login/ ~/.login
echo "Installing Vim config files (vimrc)"
ln -s $PWD/vimrc ~/.vimrc
