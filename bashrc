#=============================================================
#
# PERSONAL $HOME/.bashrc FILE for bash (tested on 4.2)
# By Leonardo Vilela Teixeira <leolvt@gmail.com>
# TODO: Copied from Emmanuel Rouat <emmanuel.rouat@wanadoo.fr>
#
# Last modified: Fri Sep  9 21:39:01 BRT 2011
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#
# The majority of the code here assumes you are on a GNU 
# system (most likely a Linux box) and is based on code found
# on Usenet or internet. 
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

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

#-------------------------------------------------------------
# 1) Update PATH and other envvars.
#-------------------------------------------------------------

LOCALPATH=~/.local/bin:~/Tools:~/.gem/ruby/1.9.1/bin
export PATH=$PATH:$LOCALPATH
export TEXMFHOME=~/.texmf
export EDITOR=vim
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export PERL_LOCAL_LIB_ROOT="/home/vilela/.local";
export PERL_MB_OPT="--install_base /home/vilela/.local";
export PERL_MM_OPT="INSTALL_BASE=/home/vilela/.local";
export PERL5LIB="/home/vilela/.local/lib/perl5/x86_64-linux-thread-multi:/home/vilela/.local/lib/perl5";

#-------------------------------------------------------------
# 2) Source global definitions (if any)
#-------------------------------------------------------------

# TODO: Instead of sourcing, copy the relevant contents
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load profiles from /etc/profile.d
# TODO: Check for duplicated ENVVARS and PATH
if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.bash; do
        test -r "$profile" && . "$profile"
    done

	#for profile in /etc/profile.d/*.bash; do
		#test -r "$profile" && . "$profile"
	#done

	unset profile
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


# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# ... and ignore same sucessive entries.
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

NC='\[\033[0m\]'              # No Color

# Some remote/local Highlight
if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${CYAN}   # remote machine: prompt will be partly red
else
    HILIT=${PURPLE}  # local machine: prompt will be partly cyan
fi

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
        *term | rxvt | linux )
    		PS1="${MY_PROMPT}" ;;
#        linux )
#            PS1="${HILIT}[\A]$NC\n[\u@\h \#] \W > " ;;
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


