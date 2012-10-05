#-------------------
# Personnal Aliases
#-------------------

alias gvimt="gvim --remote-tab"

#-------------------------------------------------------------
# spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias ..='cd ..'
alias cd..='cd ..'
alias ckear='clear'
alias cçear='clear'
alias mroe='more'
alias pdw=pwd
alias moer='more'

#-------------------
# Safety Aliases
#-------------------

alias rm='rm -I'  # Confirm before recursive or multifile rm
alias mkdir='mkdir -p' # Prevents accidentally clobbering files.

#-------------------
# Useful Aliases
#-------------------

alias which='type -a'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
#alias print='/usr/bin/lp -o nobanner -d $LPDEST'
            # Assumes LPDEST is defined (default printer)
#alias pjet='enscript -h -G -fCourier9 -d $LPDEST'
            # Pretty-print using enscript

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'


#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -A'           # show hidden files
alias lla='ll -A'          # show hidden files in list
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ll |more'        # pipe through 'more'
alias lr='ll -R'           # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

# If your version of 'ls' doesn't support --group-directories-first try this:
# function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
#                egrep -v "^d|total "; }

#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export LESSCHARSET='utf-8'
export PAGER=less

# Use this if lesspipe.sh exists
if [[ -f /usr/bin/lesspipe.sh ]]; then
    export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' 
fi

#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
export LESS='-i -w -g -M -R -PM ?f%f:Standard Input.?lb - line %lt?L of %L:.:.?pB ( %pB\% ):.'

#---------------------
# Some useful aliases
#---------------------

# Make aliases available to sudo:
alias sudo='sudo  '

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pu="pushd"
alias po="popd"


#---------------------
# Csh compatability:
#---------------------
alias unsetenv=unset

