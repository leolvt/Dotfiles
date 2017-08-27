ask () {
	echo -n "$@" '[y/N] '
	read ans
	case "$ans" in
		(y* | Y*) return 0 ;;
		(*) return 1 ;;
	esac
}

# ==================================================== #

is_interactive=
use_ssh=
gave_dest_dir=
DEST_DIR=$HOME/dotfiles
GIT_HTTPS_URL="https://github.com/leolvt/Dotfiles.git"
GIT_SSH_URL="git@github.com:leolvt/Dotfiles.git"

while getopts isd: name
do
   case $name in
   i)   is_interactive=1;;
   s)	use_ssh=1;;
   d)	gave_dest_dir=1
		DEST_DIR="$OPTARG";;
   ?)   printf "Usage: %s: [−i] [-s] [-d DEST_DIR]\n" $0
	    printf "\n"
		printf "  -i			enable interactive mode\n"
		printf "  -s			clone repo using SSH URL\n"
		printf "  -d DEST_DIR	clone repo to DEST_DIR\n"
		exit 2;;
   esac
done

shift $(($OPTIND - 1))

if [[ -n $* ]]; then
	printf "[WARNING] Unused remaining arguments are: %s\n" "$*"
fi

if [[ -z $gave_dest_dir && -n $is_interactive ]]; then
	echo "[PROMPT] Please, indicate destination folder (or press ENTER for default: $DEST_DIR)"
	read ans
	if [[ ! -z $ans ]]; then
		DEST_DIR=$ans
	fi
fi

mkdir -p $DEST_DIR
errcode=$?
if [[ $errcode -ne 0 ]]; then
	echo "[FATAL] Failed to create destination folder: $DEST_DIR"
	echo "[FATAL] Aborting :("
	exit $errcode
fi
DEST_DIR=$(cd $DEST_DIR; pwd)

if [[ -z $(ls -A $DEST_DIR) ]]; then
	printf "[INFO] Installing Dotfiles to: '%s'\n" $DEST_DIR
else
	echo "[FATAL] Destination folder is not empty. Aborting :("
	exit 1
fi

[[ -n $is_interactive ]] && (echo 'Press any key to continue...'; read)

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p $XDG_CONFIG_HOME

if [[ -z $use_ssh && -n $is_interactive ]]; then
	ask "[PROMPT] Clone using SSH?" && use_ssh=1
fi

if [[ -n $use_ssh ]]; then
	GIT_URL=$GIT_SSH_URL
else
	GIT_URL=$GIT_HTTPS_URL
fi

echo "[INFO] Cloning dotfiles repository ($GIT_URL)"
[[ -n $is_interactive ]] && (echo 'Press any key to continue...'; read)
git clone --recursive $GIT_URL "$DEST_DIR" || (echo "[FATAL] Aborting :(" && exit 1)

echo "[INFO] Updating RCM configuration with dotfiles folder"
ln -s $DEST_DIR $XDG_CONFIG_HOME

echo "[INFO] Seting up dotfiles through RCM"
[[ -n $is_interactive ]] && (echo 'Press any key to continue...'; read)
env RCRC=$DEST_DIR/config/rcrc rcup

echo "[INFO] Setting up antigen plugins"
[[ -n $is_interactive ]] && (echo 'Press any key to continue...'; read)
source $XDG_CONFIG_HOME/zsh/.zshrc

echo "[INFO] Setting up Vim plugins"
mkdir -p $HOME/.cache/vim
zsh -c "vim +PluginInstall +qall"

TEXMFDIR=${TEXMFHOME:-$HOME/.local/share/texmf}
echo "[INFO] Creating TeX folders at $TEXMFDIR"
[[ -n $is_interactive ]] && (echo 'Press any key to continue...'; read)
mkdir -p $TEXMFDIR/
mkdir -p $TEXMFDIR/bibtex
mkdir -p $TEXMFDIR/bibtex/bib
mkdir -p $TEXMFDIR/bibtex/bib/base
mkdir -p $TEXMFDIR/bibtex/bib/misc
mkdir -p $TEXMFDIR/bibtex/bst
mkdir -p $TEXMFDIR/bibtex/bst/base
mkdir -p $TEXMFDIR/bibtex/bst/misc
mkdir -p $TEXMFDIR/doc
mkdir -p $TEXMFDIR/fonts
mkdir -p $TEXMFDIR/fonts/map
mkdir -p $TEXMFDIR/fonts/lig
mkdir -p $TEXMFDIR/fonts/enc
mkdir -p $TEXMFDIR/metafont
mkdir -p $TEXMFDIR/metafont/base
mkdir -p $TEXMFDIR/metafont/misc
mkdir -p $TEXMFDIR/metafont/support
mkdir -p $TEXMFDIR/metapost
mkdir -p $TEXMFDIR/metapost/base
mkdir -p $TEXMFDIR/metapost/misc
mkdir -p $TEXMFDIR/metapost/support
mkdir -p $TEXMFDIR/mtf
mkdir -p $TEXMFDIR/source
mkdir -p $TEXMFDIR/scripts
mkdir -p $TEXMFDIR/tex
mkdir -p $TEXMFDIR/tex/generic
mkdir -p $TEXMFDIR/tex/generic/hyphen
mkdir -p $TEXMFDIR/tex/generic/images
mkdir -p $TEXMFDIR/tex/generic/misc
mkdir -p $TEXMFDIR/tex/latex


echo "[INFO] Setting up SSH authorized keys"
cat $HOME/.ssh/*.pub > $HOME/.ssh/authorized_keys


echo "[INFO] Finished. Make sure to re-login on the shell for changes to take effect."
