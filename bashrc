#=============================================================
#
# Bash Configuration File (.bashrc) 
# ---------------------------------
#
# Author: Leonardo Vilela Teixeira <leolvt@gmail.com>
# Inspired by many bashrc files found on the internet and also
# on system default bashrc.
#
# Great part of this file was inspired (copied) from the sample
# .bashrc from Emmanuel Rouat <emmanuel.rouat@wanadoo.fr> which
# you can find at http://tldp.org/LDP/abs/html/sample-bashrc.html
#
# The majority of the code here assumes you are on a GNU 
# system (most likely a Linux box).
#
#=============================================================
#
# Summary:
#
# 1) Update PATH and other envvars.
# 2) Source global definitions (if any)
# 3) Source local definitions, aliases and functions (if any)
# 4) Configure Bash History and Shell Options  
# 5) Coloring options
# 6) Shell Prompt
# 7) Bash Completion
# 8) Run Login Script (Greetings, motd, etc...)
#
#=============================================================

#-------------------------------------------------------------
# If not running interactively, don't do anything
#-------------------------------------------------------------

# Added two method for checking if current session is interactive.
# Probably an overkill, but not sure of which one is better or
# more guaranteed to exist.
[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

#-------------------------------------------------------------
# 1) Update PATH and other envvars.
#-------------------------------------------------------------

# Add some places to the PATH variable. Currently, only the 
# local bin and ruby gems folder.
LOCALPATH=~/.local/bin:~/.gem/ruby/1.9.1/bin
export PATH=$PATH:$LOCALPATH

# Local LaTeX files under this dir:
export TEXMFHOME=~/.texmf

# Default editor is vim and multiple files are opened in multiple
# tabs
export EDITOR="vim -p"

# Some java stuff intended to make its look and feel better and
# more similar to GTK
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

# Perl variables used to locate packages
export PERL_LOCAL_LIB_ROOT="/home/vilela/.local";
export PERL_MB_OPT="--install_base /home/vilela/.local";
export PERL_MM_OPT="INSTALL_BASE=/home/vilela/.local";
export PERL5LIB="/home/vilela/.local/lib/perl5/x86_64-linux-thread-multi:/home/vilela/.local/lib/perl5";

#-------------------------------------------------------------
# 2) Source global definitions (if any)
#-------------------------------------------------------------

# Used to source global bashrc file here, but since many of
# those also source the user's .bashrc, it would cause a double 
# sourcing of this file. So, instead, copy any stuff you want to 
# this file.

# Load profiles from /etc/profile.d
# Remember: The /etc/profile loads all the /etc/profile.d/*.sh 
# files. Here we load only the *.bash ones. But even that may 
# be wrong if the same script has a .sh and a .bash version.
# TODO: Check for duplicated ENVVARS and PATH
if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.bash; do
        test -r "$profile" && . "$profile"
    done

	unset profile
fi

# If the Command Not Found hook from pkgfile is available, source it!
# Note: pkgfile is a package from Arch Linux.

if [ -f /usr/share/doc/pkgfile/command-not-found.bash ]; then
    . /usr/share/doc/pkgfile/command-not-found.bash 
fi

#-------------------------------------------------------------
# 3) Source local definitions, aliases and functions (if any)
#-------------------------------------------------------------

if [ -d ~/.login ]; then

	# Source local functions
	if [ -f ~/.login/functions ]; then
		. ~/.login/functions
	fi

	# Source Aliases
	if [ -f ~/.login/aliases ]; then
		. ~/.login/aliases
	fi
fi

#-------------------------------------------------------------
# 4) Configure Bash History and Shell Options  
#-------------------------------------------------------------


# Don't put duplicate lines in the history and ignore same 
# sucessive entries.See bash(1) for more options.
export HISTCONTROL=ignoreboth

# History Ignore
export HISTIGNORE="[   ]*:&:bg:fg"

# Append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#-------------------------------------------------------------
# 5) Coloring options
#-------------------------------------------------------------

# Enable color support of ls
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    if [ -x ~/.login/dircolors ]; then
        eval "`dircolors ~/.login/dircolors`"
    else
        eval "`dircolors -b`"
    fi
fi

# Define some colors 
gray='\[\033[0;30m\]'
GRAY='\[\033[1;30m\]'
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
green='\[\033[0;32m\]'
GREEN='\[\033[1;32m\]'
brown='\[\033[0;33m\]'
BROWN='\[\033[1;33m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
purple='\[\033[0;35m\]'
PURPLE='\[\033[1;35m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
white='\[\033[0;37m\]'
WHITE='\[\033[1;37m\]'
NC='\[\033[0m\]' # No Color

# And a nice function to print them out
function PRINT_COLORS
{
	echo -e "${gray} gray"
	echo -e "${GRAY} GRAY"
	echo -e "${red} red"
	echo -e "${RED} RED"
	echo -e "${green} green"
	echo -e "${GREEN} GREEN"
	echo -e "${brown} brown"
	echo -e "${BROWN} BROWN"
	echo -e "${blue} blue"
	echo -e "${BLUE} BLUE"
	echo -e "${purple} purple"
	echo -e "${PURPLE} PURPLE"
	echo -e "${cyan} cyan"
	echo -e "${CYAN} CYAN"
	echo -e "${white} white"
	echo -e "${WHITE} WHITE"
	echo -e "${NC} NC"
}

# Some remote/local Highlight
if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${CYAN}   # remote machine: prompt will be partly red
else
    HILIT=${PURPLE}  # local machine: prompt will be partly cyan
fi


#-------------------------------------------------------------
# 6) Shell Prompt
#-------------------------------------------------------------

# Pick Prompt Colors

tclr_time=$GREEN
tclr_user=$BLUE
tclr_at=$brown
tclr_host=$green
tclr_brkt=$BROWN
tclr_wdir=$HILIT
tclr_sym=$RED
tclr_cmds=$NC
tclr_numcmd=$red

MSG=""
function setupprompt()
{
    if [[ $UID -eq 0 ]]
    then
        SYMB="#"
    else
        SYMB="$"
    fi

    # Message before the Prompt
    MY_PROMPT="${HILIT}$MSG" 
    MY_PROMPT="$MY_PROMPT$tclr_brkt[$tclr_wdir\w$tclr_brkt]\n"
    MY_PROMPT="$MY_PROMPT$tclr_brkt["
    MY_PROMPT="$MY_PROMPT$tclr_time\A "
    MY_PROMPT="$MY_PROMPT$tclr_user\u"
    MY_PROMPT="$MY_PROMPT$tclr_at@$tclr_host\h "
    MY_PROMPT="$MY_PROMPT$tclr_numcmd\#$tclr_brkt]"
    MY_PROMPT="$MY_PROMPT$tclr_sym $SYMB $tclr_brkt> $tclr_cmds"

    case $TERM in
        *term | rxvt* | gnome* | linux | screen )
    		PS1="${MY_PROMPT}" ;;
        #screen)
            #PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
            #;;
        * )
            PS1="[\A]\n[\u@\h \#] \W > " ;;
    esac
}

setupprompt

# Fallback fastprompt
function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}

PS2='> '
PS3='= '
PS4='+ '

#-------------------------------------------------------------
# 7) Bash Completion
#-------------------------------------------------------------

# enable programmable completion features (
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion 
fi

#-------------------------------------------------------------
# 8) Run Login Script (Greetings, motd, etc...)
#-------------------------------------------------------------

if [ -f ~/.login/on_login ]; then
    . ~/.login/on_login
fi


