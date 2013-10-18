" Plugin configurations
" --------------------

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" Vim-Voogle {{{
" Change mapping (conflict with swap parametes)
let g:voogle_map = '<Leader>gog'

" }}}

" Google I'm Feeling Lucky URL Grabber {{{
"let g:LuckyOutputFormat='markdown'
" }}}

" Multiple-Cursors {{{
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-N>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" MiniBufExplorer {{{
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplCloseOnSelect = 0
"let g:miniBufExplBuffersNeeded=2
"let g:miniBufExplHideWhenDiff=1
" }}}

" SnipMate {{{
"let g:snips_author = 'Leonardo Vilela Teixeira'
" }}}

" Syntastic {{{
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_cpp_ycm_args = ''
" }}}

" Old unused stuff {{{
" Clang-Complete config
" ---------------------
"fun! SetClangCompleteOptions()
"" Don't strip on these filetypes
"let g:clang_complete_copen=0
"let g:clang_periodic_quickfix=0
"let g:clang_snippets=1
"let g:clang_snippets_engine='snipmate'
"let g:clang_use_library=1
"let g:clang_close_preview=1
""let g:clang_complete_macros=1
""let g:clang_complete_patterns=1
"" the periodic_quick fix option.
""nmap <F5> :call g:ClangUpdateQuickFix()<CR>:copen
"endfun

"augroup setup_for_C_Cpp
"au!
"au FileType c,cpp call SetClangCompleteOptions()
"augroup END

" ==========================

" ==========================

" ==========================
" Powerline config
" ==========================
"set laststatus=2
"let g:Powerline_cache_enabled = 1
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_theme = 'skwp'
"let g:Powerline_colorscheme = 'skwp'

" ==========================
" }}}

" UltiSnips {{{
let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<c-j>"
let g:UltiSnips.JumpForwardTrigger = "<c-j>"
"let g:UltiSnips.UltiSnips_ft_filter = {
			"\ 'default' : {'filetypes': ['all'] },
			"\ 'all' : {'filetypes': ['all'] },
			"\ 'cpp' : {'filetypes': ['cpp'], 'dir-regex': '[._]vim/UltiSnips$' },
			"\ }
" }}}

" You Complete Me {{{
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_allow_changing_updatetime = 0
" }}}

" std_c {{{
let c_space_errors = 1
let c_comment_strings = 1
let c_comment_numbers = 1
let c_comment_types = 1
let c_comment_date_time = 1
" }}}
