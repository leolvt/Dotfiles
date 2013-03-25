#!/bin/sh

# Set Install dir
DEST=${XDG_CONFIG_HOME:-$HOME/.config}

# --------------------------
# First, a simple check to see if we are inside the right folder
if [ ! -f "bash/bashrc" ]; then
    echo "ERROR: Didn't find dotfiles..."
    echo "  You must run the install script inside the Dotfiles directory."
    exit 1
fi

# --------------------------
# Now a simple check to se if we have a clean install
if [ -d $DEST/shell-common ]; then
	echo "ERROR: An installation already exists. Aborting!"
	echo "  If you are trying to reinstall the files, you should "
	echo "  run ./uninstall.sh before."
	exit 1
fi

# --------------------------
# Check if we should install bash and zsh files
INSTALL_BASH=0
INSTALL_ZSH=1
if [ $# -ge 1 ]; then
	case $1 in
		bash)
			INSTALL_BASH=1;
			INSTALL_ZSH=0;
			;;
		zsh)
			INSTALL_BASH=0;
			INSTALL_ZSH=1;
			;;
		both)
			INSTALL_BASH=1;
			INSTALL_ZSH=1;
			;;
	esac
fi

#echo -n "Install BASH files? [Y/n] "
#read ans
#case "$ans" in
	#n*|N*) INSTALL_BASH=0 ;;
#esac

#echo -n "Install ZSH files? [Y/n] "
#read ans
#case "$ans" in
	#n*|N*) INSTALL_ZSH=0 ;;
#esac

# --------------------------
echo "Installing files commom to both shells (MotD, alias, etc)"
ln -s $PWD/shell-common $DEST/shell-common

# --------------------------
# Installing bash files
if [ $INSTALL_BASH == 1 ]; then

	if [ -f ~/.bashrc ]; then
		echo "ERROR: ~/.bashrc already exists. Aborting!"
		echo "  If you are trying to reinstall the files, you should "
		echo "  run ./uninstall.sh before."
		exit 1
	fi

	echo "Installing Bash config files (bashrc, bash_logout, etc.)"
	ln -s $PWD/bash/bash_login ~/.bash_login
	ln -s $PWD/bash/bash_logout ~/.bash_logout
	ln -s $PWD/bash/bashrc ~/.bashrc
	ln -s $DEST/shell-common/aliases.sh ~/.bash_aliases
	ln -s $DEST/shell-common/functions.sh ~/.bash_functions
fi

# --------------------------
# Installing zsh files
if [ $INSTALL_ZSH == 1 ]; then

	if [ -f ~/.zshrc ]; then
		echo "ERROR: ~/.zshrc already exists. Aborting!"
		echo "  If you are trying to reinstall the files, you should "
		echo "  run ./uninstall.sh before."
		exit 1
	fi

	echo "Installing zsh config files (and oh-my-zsh)"
    git clone git://github.com/robbyrussell/oh-my-zsh.git $DEST/oh-my-zsh
	ln -s $PWD/zsh/zshrc ~/.zshrc
	ln -s $PWD/zsh/*.zsh $DEST/oh-my-zsh/custom/
	ln -s $DEST/shell-common/aliases.sh	$DEST/oh-my-zsh/custom/aliases.zsh
	ln -s $DEST/shell-common/functions.sh $DEST/oh-my-zsh/custom/functions.zsh
	ln -s $DEST/shell-common/motd.sh $DEST/oh-my-zsh/custom/motd.zsh
fi

# --------------------------
echo "Installing Git config files (gitconfig, gitignore-global)"
ln -s $PWD/git/gitconfig ~/.gitconfig
ln -s $PWD/git/gitignore-global ~/.gitignore-global

# --------------------------
echo "Installing Vim config files (vimrc)"
mkdir -p ~/.vim/colors
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim/bundles.vim ~/.vim/bundles.vim

# --------------------------
echo "Installing font configuration file (.fonts.conf)"
mkdir -p $DEST/fontconfig
ln -s $PWD/various/fonts.conf $DEST/fontconfig/fonts.conf
# --------------------------

echo "Installing X config files (xprofile, Xresources)"
ln -s $PWD/various/xprofile ~/.xprofile
ln -s $PWD/various/Xresources ~/.Xresources

# --------------------------
echo "Creating TEXMF local dir"
various/make-tex-dirs.sh create

# --------------------------
if [ ! -d "~/.vim/bundle/vundle" ]; then
    echo "Installing Vim Vundle script, to manage vim plugins."
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo "Installing Vim Bundles"
    #vim -u ~/.vim/bundles.vim +BundleInstall +q
    vim +BundleInstall +qall
fi
