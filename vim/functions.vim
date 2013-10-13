" ==========================
" Display Syntax Class
" ==========================

nmap <C-S-S> :call SynStack()<CR>
function! SynStack()
    "function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

