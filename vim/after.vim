" Fix meta-keys which generate <Esc>a .. <Esc>z {{{
"let c='a'
"while c <= 'z'
"  echo "set <M-".toupper(c).">=\e".c
"  echo "imap \e".c." <M-".toupper(c).">"
"let c = nr2char(1+char2nr(c))
"endw
