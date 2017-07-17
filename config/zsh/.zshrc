# ==================================================== #
# ENVVARS
# ==================================================== #

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}

export CURRENT_OS=$(uname -s)

export RCRC=$XDG_CONFIG_HOME/rcrc
export HISTFILE=$XDG_CONFIG_HOME/zsh_history
export ADOTDIR=$XDG_CONFIG_HOME/antigen/runtime
export TEXMFHOME=$HOME/.local/share/texmf

LOCAL_PATH=$HOME/.local/bin
RUBY_PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin
export PATH=$LOCAL_PATH:$RUBY_PATH:$PATH

export PERL_LOCAL_LIB_ROOT="$HOME/.local";
export PERL_MB_OPT="--install_base $HOME/.local";
export PERL_MM_OPT="INSTALL_BASE=$HOME/.local";
export PERL5LIB="$HOME/.local/lib/perl5/x86_64-linux-thread-multi:$HOME/.local/lib/perl5";

# Make Qt and Java look like GTK
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export QT_STYLE_OVERRIDE="gtk"

# Set the correct TERM for tmux with 256 colors
#[ -n "$TMUX" ] && export TERM=screen-256color

export EDITOR="vim -p"

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export dirstack_file=$ZDOTDIR/.zdirs

export LESSHISTFILE=$XDG_CACHE_HOME/lesshst

# ==================================================== #
# Antigen
# ==================================================== #

source $XDG_CONFIG_HOME/antigen/repo/antigen.zsh

antigen use oh-my-zsh

#antigen bundle vi-mode

antigen bundle adb
antigen bundle autojump
antigen bundle catimg
antigen bundle command-not-found
antigen bundle dotenv
antigen bundle extract
antigen bundle git-extras
antigen bundle pip
antigen bundle python
antigen bundle rsync
#antigen bundle ssh-agent
antigen bundle tmux
antigen bundle web-search
antigen bundle sudo

#antigen bundle kennethreitz/autoenv

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# OS specific plugins
if [[ $CURRENT_OS == 'Darwin' ]]; then
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    antigen bundle systemd
fi

# Load the theme.
# antigen theme gallois
# antigen theme terminalparty
antigen theme ys

# Tell Antigen that you're done.
antigen apply

# ==================================================== #
# Other ZSH configuration
# ==================================================== #

# Some key bidings for vi-mode
#bindkey -a 'gg' beginning-of-buffer-or-history
#bindkey -a G end-of-buffer-or-history
#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down
#
## Set some ZSH options:
#setopt RM_STAR_SILENT
#setopt NO_AUTO_CD
#setopt NULL_GLOB
#

# Load aliases and functions
source $XDG_CONFIG_HOME/shell_common/aliases.sh
source $XDG_CONFIG_HOME/shell_common/functions.sh




# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line


# ==================================================== #

