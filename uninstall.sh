#!/bin/bash

if [ -f ~/.bashrc ] && [ ! -h ~/.bashrc ]; then
    echo "ERROR: ~/.bashrc already exists and is not a symlink. Aborting!"
    exit 1
elif [ ! -f ~/.bashrc ]; then
    echo "WARNING: No ~/.bashrc found. Terminating."
    exit 0
fi

echo "Uninstalling Bash config files (bashrc, bash_logout)"
rm ~/.bash_login
rm ~/.bash_logout
rm ~/.bashrc
echo "Uninstalling Git config files (gitconfig, gitignore-global)"
rm ~/.gitconfig
rm ~/.gitignore-global
echo "Uninstalling custom login files"
rm ~/.login
echo "Uninstalling Vim config files (vimrc)"
rm ~/.vimrc
rm ~/.vim/colors/molokai-glass.vim
rm ~/.vim/bundles.vim
echo "Uninstalling Vim Vundle script, to manage vim plugins."
echo "  Note that the installed bundles will remain installed, but"
echo "  not working, since Vundle will be uninstalled..."
rm -rf ~/.vim/bundle/vundle
echo "Uninstalling font configuration file (.fonts.conf)"
rm $XDG_CONFIG_HOME/fontconfig/fonts.conf
echo "Uninstalling X config files (xprofile, Xresources)"
rm ~/.xprofile
rm ~/.Xresources
