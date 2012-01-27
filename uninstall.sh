#!/bin/bash

echo "Uninstalling Bash config files (bashrc, bash_login, bash_logout)"
unlink ~/.bash_login
unlink ~/.bash_logout
unlink ~/.bashrc
echo "Uninstalling Git config files (gitconfig, gitignore-global)"
unlink ~/.gitconfig
unlink ~/.gitignore-global
echo "Uninstalling custom login files"
unlink ~/.login
echo "Uninstalling Vim config files (vimrc)"
unlink ~/.vimrc
