" Plugin configurations
" --------------------

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" UltiSnips {{{
let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger='<C-J>'
let g:UltiSnips.ListSnippets='C-TAB>'
let g:UltiSnips.JumpForwardTrigger='<C-J>'
let g:UltiSnips.JumpBackwardTrigger='<C-K>'
"let g:UltiSnips.UltiSnips_ft_filter = {
	"\ 'default' : {'filetypes': ['all'] },
	"\ 'all' : {'filetypes': ['all'] },
	"\ 'cpp' : {'filetypes': ['cpp'], 'dir-regex': '[._]vim/UltiSnips$' },
	"\ }
" }}}

" You Complete Me {{{
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_allow_changing_updatetime = 0
let g:ycm_global_ycm_extra_conf = '~/.config/ycm/extra_conf.py'
" }}}

" std_c {{{
let c_space_errors = 1
let c_comment_strings = 1
let c_comment_numbers = 1
let c_comment_types = 1
let c_comment_date_time = 1
" }}}

" Syntastic {{{
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1

"let g:syntastic_cpp_ycm_args = ''
" }}}

