" ==========================
" Display Syntax Class
" ==========================

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    "function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

