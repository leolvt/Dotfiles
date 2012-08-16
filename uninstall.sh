#!/bin/bash

if [ -f ~/.bashrc ] && [ ! -h ~/.bashrc ]; then
    echo "ERROR: ~/.bashrc already exists and is not a symlink. Aborting!"
    exit 1
elif [ ! -f ~/.bashrc ]; then
    echo "WARNING: No ~/.bashrc found. Terminating."
    exit 0
fi

echo "Uninstalling Bash config files (bashrc, bash_logout)"
#unlink ~/.bash_login
unlink ~/.bash_logout
unlink ~/.bashrc
echo "Uninstalling Git config files (gitconfig, gitignore-global)"
unlink ~/.gitconfig
unlink ~/.gitignore-global
echo "Uninstalling custom login files"
unlink ~/.login
echo "Uninstalling Vim config files (vimrc)"
unlink ~/.vimrc
unlink ~/.vim/bundles.vim
echo "Uninstalling Vim Vundle script, to manage vim plugins."
echo "  Note that the installed bundles will remain installed, but"
echo "  not working, since Vundle will be uninstalled..."
rm -rf ~/.vim/bundle/vundle
echo "Uninstalling font configuration file (.fonts.conf)"
unlink ~/.fonts.conf
echo "Uninstalling X config files (xprofile, Xresources)"
unlink ~/.xprofile
unlink ~/.Xresources
