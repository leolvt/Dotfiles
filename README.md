# How to install

Before starting, make sure that your shell is `zsh` and you have [RCM](https://github.com/thoughtbot/rcm) installed.

~~~sh
tmpfile=$(mktemp) && curl -C - -o $tmpfile https://raw.githubusercontent.com/leolvt/Dotfiles/master/install.sh && zsh $tmpfile -i && rm $tmpfile
~~~

