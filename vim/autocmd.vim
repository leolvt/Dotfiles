
if has("autocmd")

    " Rainbow Parenthesis {{{
    augroup RainbowParentheses
        au!
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    augroup END
    " }}}

    " Set some format options {{{
    augroup FormatOptions
        autocmd!
        " No formatting on o key newlines
        autocmd BufNewFile,BufEnter * set formatoptions-=o
        " No break of already long lines when inserting
        autocmd BufNewFile,BufEnter * set formatoptions+=l
    augroup END
    " }}}

    " Trailing whitespace {{{
    " Only shown when not in insert mode so I don't go insane.
    " Also, remove them when saving file
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:␣
        au InsertLeave * :set listchars+=trail:␣
        au BufWritePre * :%s/\s\+$//e
    augroup END
    " }}}

    " Highlight long and almost lines {{{
    augroup LongLineMatching
        autocmd!
        "autocmd BufWinEnter * call s:SetLongLineMatching()
        "autocmd BufWinEnter * let w:whitespace_match_number =
        "\ matchadd('ExtraWhitespace', '\s\+$')
        autocmd Syntax * call s:SetLongLineMatching()
    augroup END

    function! s:SetLongLineMatching()
        " Define the pattern for almost long line
        let l:MatchWarning = (&tw > 0) ?
                    \ "\\%<".(&tw+1)."v.\\%>".(&tw-3)."v"
                    \ : "\\%<81v.\\%>77v"
        " Add (or update) the match
        if exists('w:almost_long_match_number')
            call matchdelete(w:almost_long_match_number)
            call matchadd('WarningMsg', l:MatchWarning, 10,
                        \ w:almost_long_match_number)
        else
            let w:almost_long_match_number = matchadd('WarningMsg',
                        \ l:MatchWarning)
        endif

        " Define the pattern fot long line
        let l:MatchError = (&tw > 0) ?  "\\%".(&tw+1)."v.*" : "\\%81v.*"
        " Add (or update) the match
        if exists('w:long_match_number')
            call matchdelete(w:long_match_number)
            call matchadd('ErrorMsg', l:MatchError, 10, w:long_match_number)
        else
            let w:long_match_number =  matchadd('ErrorMsg', l:MatchError)
        endif
    endfunction
    " }}}

    " Highlight extra spaces {{{
    augroup WhitespaceMatch
        autocmd!
        autocmd BufWinEnter * call s:ToggleWhitespaceMatch('n')
        autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
        autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
        "autocmd Syntax * syn match ExtraWhitespace / \+\ze\t/
        "autocmd Syntax * syn match ExtraWhitespace /\%(^\|\t\)\@<!\t/
    augroup END

    function! s:ToggleWhitespaceMatch(mode)
        let pEOL = (a:mode == 'i') ?
                    \ '\s\+\%#\@<!$' :
                    \ '\s\+$'
        let pWrongTab = (a:mode == 'i') ?
                    \ '\%(^\t*\)\@<![ \t]*\t[ \t]*\%#\@<!' :
                    \ '\%(^\t*\)\@<![ \t]*\t[ \t]*'

        let pattern = '\%('.pEOL.'\)' . '\|' .
                    \ '\%('.pWrongTab.'\)'
        if exists('w:ws_match_id')
            call matchdelete(w:ws_match_id)
            call matchadd('WarningMsg', pattern, 10, w:ws_match_id)
        else
            " Something went wrong, try to be graceful.
            let w:ws_match_id =  matchadd('WarningMsg', pattern)
        endif
    endfunction
    " }}}

    " When editing a file, always jump to the last cursor position. {{{
    " This must be after the uncompress commands.
    augroup LastLine
        autocmd!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line ("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
    " }}}

    " Run ctags on C/C++ files via <F5> {{{
    "augroup CTags
        "autocmd!
        "autocmd FileType c,cpp
                    "\ nmap <F5>
                    "\ :!clang -M *.cpp \|
                    "\ sed -e 's/[\\ ]/\n/g' \|
                    "\  sed -e '/^$/d' -e '/\.o:[ \t]*$/d' \|
                    "\ ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
                    "\ <CR><CR>
    "augroup END
    " }}}

    " Set folding for vim files {{{
    augroup ft_vim
        au!

        au FileType vim setlocal foldmethod=marker | setlocal foldlevelstart=0
        au FileType help setlocal textwidth=78
        au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    augroup END
    " }}}

endif

