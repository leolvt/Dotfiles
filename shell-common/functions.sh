#-------------------------------------------------------------
# Git helpers:
#-------------------------------------------------------------

function sink()
{
    B="\033[01;34m"
    G="\033[01;32m"
    R="\033[01;31m"
    O="\033[00;33m"
    Y="\033[01;33m"
    C="\033[00;36m"
    P="\033[01;35m"
    W="\033[00;37m"
    NC="\033[00;0m"
    local FUNC_PROMPT="$Y>> ${O}[${R}SINK${B}${O}] ${Y}>>${Y}"
    echo -e "$FUNC_PROMPT Getting branch name... $W"
    CURRENT=`git branch | grep '\*' | awk '{print $2}'`
    echo -e "$FUNC_PROMPT Checking out 'master' branch... $W"
    git checkout master
    echo -e "$FUNC_PROMPT Pulling upstream updates... $W"
    git pull origin master
    echo -e "$FUNC_PROMPT Going back to '$CURRENT' branch... $W"
    git checkout ${CURRENT}
    echo -e "$FUNC_PROMPT Rebasing '$CURRENT' onto 'master'... $W"
    git rebase -i master
    echo -e "$FUNC_PROMPT DONE!$NC"
}

#-------------------------------------------------------------

function ship()
{
    sink

    B="\033[1;34m"
    G="\033[1;32m"
    R="\033[1;31m"
    O="\033[0;33m"
    P="\033[1;35m"
    Y="\033[1;33m"
    W="\033[0;37m"
    NC="\033[0m"
    local FUNC_PROMPT="$Y>> ${O}[${G}SHIP${B}${O}] ${Y}>>${Y}"
    echo -e "$FUNC_PROMPT Getting branch name... $W"
    CURRENT=`git branch | grep '\*' | awk '{print $2}'`
    echo -e "$FUNC_PROMPT Checking out 'master' branch... $W"
    git checkout master
    echo -e "$FUNC_PROMPT Merging '$CURRENT' to 'master'... $W"
    git merge ${CURRENT}
    echo -e "$FUNC_PROMPT Pushing new changes... $W"
    git push origin master
    echo -e "$FUNC_PROMPT Going back to '$CURRENT'... $W"
    git checkout ${CURRENT}
    echo -e "$FUNC_PROMPT DONE!$NC"
}

#-------------------------------------------------------------
# General Purpose functions
#-------------------------------------------------------------

## TODO: Many of these functions don't work anymore. Must fix it!

#------------------------------------------------------------------------------#

# Prints the last minute Load Rate
function pLoad()
{
	uptime | sed -e "s_.*: \([^,]*\).*_\1_"
}

#------------------------------------------------------------------------------#

# Prints the uptime.

function pUpTime()
{
	uptime | sed -e "s_.*\([0-9][0-9]*\):\([0-9]*\),.*_\1h\2m_"
}

#------------------------------------------------------------------------------#


function xtitle()      # Adds some text in the terminal frame.
{
    case "$TERM" in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)
            ;;
    esac
}

# aliases that use xtitle
alias top='xtitle Processes on $HOSTNAME && top'
#alias make='xtitle Making $(basename $PWD) ; make'
#alias ncftp="xtitle ncFTP ; ncftp"

#------------------------------------------------------------------------------#

function setenv()
{
	if [ $# -ne 2 ] ; then
		echo "setenv: Too few arguments"
	else
		export $1="$2"
	fi
}

#------------------------------------------------------------------------------#

# Function which adds an alias to the current shell and to
# the ~/.login/aliases file.
function add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >> ~/.login/aliases
   eval alias $name=\'$value\'
   alias $name
}

#------------------------------------------------------------------------------#

# "repeat" command.  Like:
#
#	repeat 10 echo foo
function repeat ()
{
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

#------------------------------------------------------------------------------#

# Subfunction needed by `repeat'.
function _seq ()
{
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

#------------------------------------------------------------------------------#

# Grep a process
function psgrep()
{
	ps -ef | grep $1 | grep -v grep
}

#------------------------------------------------------------------------------#

# kill a process by name
function pskill()
{
	local pid
	pid=$(ps -e | grep $1 | awk '{ print $1 }')
#	pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}

#------------------------------------------------------------------------------#

# Rotate 13 - Cypher
function rot13()
{
	if [ $# = 0 ] ; then
		tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"
	else
		tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" < $1
	fi
}

#------------------------------------------------------------------------------#

# Change Mode, Owner and Group
function chmog()
{
	if [ $# -ne 4 ] ; then
		echo "usage: chmog mode owner group file"
		return 1
	else
		chmod $1 $4
		chown $2 $4
		chgrp $3 $4
	fi
}

#------------------------------------------------------------------------------#

#myip - finds your current IP if your connected to the internet
function myip ()
{
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | \
	awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

#------------------------------------------------------------------------------#

function setEnvIP() # Set IP adresses ENVVARS
{
    #MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_IP=$(ip addr show dev eth0 | \
            awk '/inet / { print substr($2, 1, length($2)-3) }')
    MY_ISP=$(myip)
}

#------------------------------------------------------------------------------#

#clock - A bash clock that can run in your terminal window.
function clock ()
{
	while true;
	do
		clear;
		echo "===========";
		date +"%r";
		echo "===========";
		sleep 1;
	done
}

#------------------------------------------------------------------------------#

#netinfo - shows network information for your system
function netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk '/inet / {print "inet: ", $2}'
	/sbin/ifconfig | awk /'broadcast/ {print "broadcast: ", $6}'
	# /sbin/ifconfig | awk /'inet addr/ {print $4}'
	#/sbin/ifconfig | awk '/ether / {print $4, $5}'
	/sbin/ifconfig | awk '/ether / {print "MAC Address: ", $2}'
	myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
	echo
	echo "${myip}"
	echo "---------------------------------------------------"
}

#------------------------------------------------------------------------------#

#shot - takes a screenshot of your current window
function shot ()
{
	import -w root -quality 75 "$HOME/shot-$(date +%s).png"
}

#-------------------------------------------------------------
# Cleaning functions
#-------------------------------------------------------------

function texClean() {
    if ask "Really clean tex output files? "; then
        rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky *.lof *.lot  *.lsb
        rm -f *.lsg *.bbl *.blg;
        echo "Cleaned.";
    else
        echo "Not cleaned.";
    fi
}

#------------------------------------------------------------------------------#

function clean() {
    if ask "Really clean this directory? "; then
        rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
        echo "Cleaned.";
    else
        echo "Not cleaned.";
    fi
}

#-------------------------------------------------------------
# Make the following commands run in background automatically:
#-------------------------------------------------------------

function soffice() { command soffice "$@" & }
function firefox() { command firefox "$@" & }
function gedit() { command gedit "$@" & }
function evince() { command evince "$@" & }
#function xpdf() { command xpdf "$@" & }

#-------------------------------------------------------------
# File & string-related functions:
#-------------------------------------------------------------

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

#------------------------------------------------------------------------------#

# Find a pattern in a set of files and highlight them:
# (needs a recent version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
    xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}

#------------------------------------------------------------------------------#

function cuttail() # cut last n lines in file, 10 by default
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

#------------------------------------------------------------------------------#

function lowercase()  # move filenames to lowercase
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}

#------------------------------------------------------------------------------#

function swap()  # Swap 2 filenames around, if they exist
{                #(from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

#------------------------------------------------------------------------------#

function extract_file()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------


function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

#------------------------------------------------------------------------------#

function killps()                 # Kill by process name.
{
    local pid pname sig="-TERM"   # Default signal.
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
        echo ${!#}
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

#------------------------------------------------------------------------------#

function ii()   # Get current host related info.
{
    RED="\033[01;31m"
    NC="\033[00m" # No Color

    echo -e "\nYou are logged on ${RED}$HOSTNAME"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    #myip 2>&- ;
    setEnvIP ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo
}

#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function ask()          # See 'killps' for example of use.
{
    echo -n "$@" '[y/N] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1;;
    esac
}

#------------------------------------------------------------------------------#

function corename()   # Get name of app that created a corefile.
{
    for file ; do
        echo -n $file : ; gdb --core=$file --batch | head -1
    done
}

#------------------------------------------------------------------------------#

#-------------------------------------------------------------
# Improvements on other commands:
#-------------------------------------------------------------

function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}