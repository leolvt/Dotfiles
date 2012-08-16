#!/bin/bash

if [ ! -f "bashrc" ]; then
    echo "ERROR: Didn't find dotfiles..."
    echo "  You must run the install script inside the Dotfiles directory."
    exit 1
fi

if [ -f ~/.bashrc ]; then
    echo "ERROR: ~/.bashrc already exists. Aborting!"
    echo "  If you are trying to reinstall the files, you should "
    echo "  run ./uninstall.sh before."
    exit 1
fi

echo "Installing Bash config files (bashrc, bash_logout)"
#ln -s $PWD/bash_login ~/.bash_login
ln -s $PWD/bash_logout ~/.bash_logout
ln -s $PWD/bashrc ~/.bashrc
echo "Installing Git config files (gitconfig, gitignore-global)"
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore-global ~/.gitignore-global
echo "Installing custom login files"
ln -s $PWD/login/ ~/.login
echo "Installing Vim config files (vimrc)"
mkdir -p ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/bundles.vim ~/.vim/bundles.vim
#vim -u ~/.vim/bundles.vim +BundleInstall +q
echo "Installing font configuration file (.fonts.conf)"
ln -s $PWD/fonts.conf ~/.fonts.conf
echo "Installing X config files (xprofile, Xresources)"
ln -s $PWD/xprofile ~/.xprofile
ln -s $PWD/Xresources ~/.Xresources

if [ ! -d "~/.vim/bundle/vundle" ]; then
    echo "Installing Vim Vundle script, to manage vim plugins."
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
