#!/bin/sh

# --------------------------
# First, a simple check to see if we are inside the right folder
if [ ! -f "bash/bashrc" ]; then
    echo "ERROR: Didn't find dotfiles..."
    echo "  You must run the install script inside the Dotfiles directory."
    exit 1
fi

# --------------------------
# Remove bash files
if [ -f ~/.bashrc ]; then
    if [ ! -h ~/.bashrc ]; then
		echo -n "WARNING: ~/.bashrc already exists and is not a symlink. Continue? [y/N]"
		read ans
		case "$ans" in
			n*|N*)
				echo "ABORTING..."
				exit 1;
				;;
		esac
		#echo "ERROR: ~/.bashrc already exists and is not a symlink. Aborting!"
		#exit 1
	fi

	echo "Uninstalling Bash config files (bashrc, bash_logout)"
	rm -f ~/.bash_login
	rm -f ~/.bash_logout
	rm -f ~/.bashrc
	rm -f ~/.bash_aliases
	rm -f ~/.bash_functions
fi

# --------------------------
# Remove zsh files
if [ -f ~/.zshrc ]; then
    if [ ! -h ~/.zshrc ]; then
		echo -n "WARNING: ~/.zshrc already exists and is not a symlink. Continue? [y/N]"
		read ans
		case "$ans" in
			n*|N*)
				echo "ABORTING..."
				exit 1;
				;;
		esac
		#echo "ERROR: ~/.zshrc already exists and is not a symlink. Aborting!"
		#exit 1
	fi

	echo "Uninstalling zsh config files (and oh-my-zsh)"
	rm -f ~/.zshrc
	rm -fr ~/.config/oh-my-zsh
fi
# --------------------------
echo "Uninstalling Git config files (gitconfig, gitignore-global)"
rm -f ~/.gitconfig
rm -f ~/.gitignore-global

# --------------------------
echo "Uninstalling files common to both shells (MotD, aliases, etc.)"
rm -f ~/.config/shell-common

# --------------------------
echo "Uninstalling Vim config files (vimrc)"
rm -f ~/.vimrc
rm -f ~/.vim/colors/molokai-glass.vim
rm -f ~/.vim/bundles.vim

# --------------------------
echo "Uninstalling Vim Vundle script, to manage vim plugins."
echo "  Note that the installed bundles will remain installed, but"
echo "  not working, since Vundle will be uninstalled..."
rm -rf ~/.vim/bundle/vundle

# --------------------------
echo "Uninstalling font configuration file (.fonts.conf)"

rm -f ${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf

# --------------------------
echo "Uninstalling X config files (xprofile, Xresources)"
rm -f ~/.xprofile
rm -f ~/.Xresources

# --------------------------
echo "Uninstalling local TEXMF dirs"
various/make-tex-dirs.sh remove
