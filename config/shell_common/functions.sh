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
    #local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q master) | sed -e "/^\s*$/d" | sed -e "s/\/.*//")
    #local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q master) | sed -e "/^\s*$/d" | sed -e "s/\(.*\)\/\(.*\)/\1  \2:\2/")
    #local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q master) | sed -e "/^\s*$/d" | sed -e "s/\(.*\)\/\(.*\)/\1  \2:\2/")
    #local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' refs/heads/master | sed -e "/^\s*$/d" | sed -e "s/\(.*\)\/\(.*\)/\1  \2:\2/")
    local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' refs/heads/master | sed -e "/^\s*$/d" | sed -e "s/\/.*//")
    echo -e "$FUNC_PROMPT Getting branch name... $W"
    CURRENT=`git branch | grep '\*' | awk '{print $2}'`
    echo -e "$FUNC_PROMPT Checking out 'master' branch... $W"
    git checkout master
    echo -e "$FUNC_PROMPT Pulling upstream updates... $W"
    git pull ${REMOTE_REPO} master
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
    local REMOTE_REPO=$(git for-each-ref --format='%(upstream:short)' refs/heads/master | sed -e "/^\s*$/d" | sed -e "s/\/.*//")
    echo -e "$FUNC_PROMPT Getting branch name... $W"
    CURRENT=`git branch | grep '\*' | awk '{print $2}'`
    echo -e "$FUNC_PROMPT Checking out 'master' branch... $W"
    git checkout master
    echo -e "$FUNC_PROMPT Merging '$CURRENT' to 'master'... $W"
    git merge ${CURRENT}
    echo -e "$FUNC_PROMPT Pushing new changes... $W"
    git push ${REMOTE_REPO} master
    echo -e "$FUNC_PROMPT Going back to '$CURRENT'... $W"
    git checkout ${CURRENT}
    echo -e "$FUNC_PROMPT DONE!$NC"
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
    echo -n "killing $1 (process $pid)..."
    kill -9 $pid
    echo "slaughtered."
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

function texClean() {
    if ask "Really clean tex output files? "; then
        command rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky *.lof *.lot *.lsb
        command rm -f *.lsg *.bbl *.blg;
        echo "Cleaned.";
    else
        echo "Not cleaned.";
    fi
}

#------------------------------------------------------------------------------#

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
