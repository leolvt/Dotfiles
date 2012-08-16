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

" ==========================
" Clang-Complete config
" ==========================
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_snippets_engine='snipmate'
let g:clang_use_library=1
let g:clang_close_preview=1
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=1
" TODO: Consider mapping some key to g:ClangUpdateQuickFix() and removing
" the periodic_quick fix option.

" ==========================
" Colors and Appearance
" ==========================

" Set theme
set background=dark
colo desert

set ruler
set nu
set nowrap
set laststatus=2
set cmdheight=2

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

" ==========================
" Tab behaviour
" ==========================

set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set smarttab
set expandtab

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
    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o

    " No more complaining about untitled documents
    autocmd FocusLost silent! :wa

    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line ("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

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

