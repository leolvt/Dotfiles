" ==========================
" Vim Configuration File (.vimrc)
" Author: Leonardo Vilela Teixeira
"
" Based on many tips and .vimrc files found over the years.
" ==========================

" ==========================
" First things first
" ==========================

" We want an improved editor, right?
set nocompatible

" Load bundles
source ~/.vim/bundles.vim

" Activate filetype and indent
filetype plugin indent on

" Set default encoding
set encoding=utf-8

" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256

" Allow hidden modified buffers
set hidden

" ==========================
" Colors and Appearance
" ==========================

" Set theme
colo molokai-glass

set ruler
set nu
set nowrap
set laststatus=2
set cmdheight=2
set cursorcolumn
set cursorline

" ==========================
" General Behaviour
" ==========================
syntax on
set wildmenu           " Wild menu (shows tab completion for commands)
set cf                 " Enable error files & error jumping
set clipboard+=unnamed " Yanks go on clipboard
set foldlevelstart=99  " Remove folds
set mouse=a
set mousehide
set textwidth=80

" ==========================
" Tab and indent behaviour
" ==========================

set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
"set smarttab
set noexpandtab
set cino=N-s,(s,us

" ==========================
" Search Behaviour
" ==========================

set ignorecase
set smartcase
set incsearch
set hlsearch

" ==========================
" Auto Commands
" ==========================

if has("autocmd")
	" Set some format options
	augroup FormatOptions
		autocmd!
		" No formatting on o key newlines
		autocmd BufNewFile,BufEnter * set formatoptions-=o
		" No break of already long lines when inserting
		autocmd BufNewFile,BufEnter * set formatoptions+=l
	augroup END

	" ---------------------------------

	" Highlight long and almost lines
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

	" ---------------------------------

	" Highlight extra spaces
	highlight ExtraWhitespace ctermbg=red guibg=red
	augroup WhitespaceMatch
		autocmd!
		autocmd BufWinEnter * let w:ws_match_id =
					\ matchadd('ExtraWhitespace', '\s\+$')
		autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
		autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
		autocmd Syntax * syn match ExtraWhitespace / \+\ze\t/
	augroup END
	function! s:ToggleWhitespaceMatch(mode)
		let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
		if exists('w:ws_match_id')
			call matchdelete(w:ws_match_id)
			call matchadd('ExtraWhitespace', pattern, 10, w:ws_match_id)
		else
			" Something went wrong, try to be graceful.
			let w:ws_match_id =  matchadd('ExtraWhitespace', pattern)
		endif
	endfunction

	" No more complaining about untitled documents
	"autocmd FocusLost silent! :wa

	" ---------------------------------

	" When editing a file, always jump to the last cursor position.
	" This must be after the uncompress commands.
	augroup LastLine
		autocmd!
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line ("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif
	augroup END

	" ---------------------------------

	" Run ctags on C/C++ files via <F5>
	augroup CTags
		autocmd!
		autocmd FileType c,cpp
					\ nmap <F5>
					\ :!clang -M *.cpp \|
					\ sed -e 's/[\\ ]/\n/g' \|
					\  sed -e '/^$/d' -e '/\.o:[ \t]*$/d' \|
					\ ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
					\ <CR><CR>
	augroup END

	" Rainbow Parenthesis
	" -------------------
	augroup RainbowParentheses
		au!
		au VimEnter * RainbowParenthesesToggle
		au Syntax * RainbowParenthesesLoadRound
		au Syntax * RainbowParenthesesLoadSquare
		au Syntax * RainbowParenthesesLoadBraces
	augroup END

	" Clang-Complete config
	" ---------------------
	fun! SetClangCompleteOptions()
		" Don't strip on these filetypes
		let g:clang_complete_copen=0
		let g:clang_periodic_quickfix=0
		let g:clang_snippets=1
		let g:clang_snippets_engine='snipmate'
		let g:clang_use_library=1
		let g:clang_close_preview=1
		"let g:clang_complete_macros=1
		"let g:clang_complete_patterns=1
		" the periodic_quick fix option.
		"nmap <F5> :call g:ClangUpdateQuickFix()<CR>:copen
	endfun

	augroup setup_for_C_Cpp
		au!
		au FileType c,cpp call SetClangCompleteOptions()
	augroup END
endif

" ==========================
" MiniBufExplorer config
" ==========================
let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplCloseOnSelect = 1
"let g:miniBufExplorerMoreThanOne=1

" ==========================
" Tagbar config
" ==========================
nmap <F8> :TagbarToggle<CR>

" ==========================
" Syntastic config
" ==========================
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1

" ==========================
" Powerline config
" ==========================
set laststatus=2
let g:Powerline_cache_enabled = 1
let g:Powerline_symbols = 'unicode'
"let g:Powerline_theme = 'skwp'
"let g:Powerline_colorscheme = 'skwp'

" ==========================
" NERDTree Mapping
" ==========================
nmap <Leader>nt :NERDTreeToggle<CR>

" ==========================
" Add the virtualenv's site-packages to vim path
" ==========================

python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

