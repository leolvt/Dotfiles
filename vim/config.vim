" Some basic stuff {{{
" We want an improved editor, right?
set nocompatible

" Set default encoding
set encoding=utf-8

" Allow hidden modified buffers
set bufhidden="hide"

" Set the leader
let mapleader = '\'
let maplocalleader = '\'

" Search for tags in git folder, then recursively up
set tags=.git/tags;$HOME
"}}}

" General Behaviour {{{1
syntax on
set wildmenu           " Wild menu (shows tab completion for commands)
set cf                 " Enable error files & error jumping
set clipboard+=unnamed " Yanks go on clipboard

"set foldlevelstart=99  " Remove folds
set foldmethod=syntax

set mouse=a
set mousehide
set textwidth=80
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc

set spelllang=en,pt
set spell
set dictionary=/usr/share/dict/words,~/.vim/dict.txt

set ignorecase
set smartcase
set incsearch
set hlsearch

" }}}

" Colors and Appearance {{{1

if has('gui_running')
    set guifont=Ubuntu\ Mono\ 11
    set background=dark
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    colorscheme solarized
else
    " Explicitly tell Vim that the terminal supports 256 colors
    set t_Co=256
    set background=dark
    let g:solarized_termcolors=256
    colorscheme solarized
endif

set ruler
set nu
set nowrap
set laststatus=2
set cmdheight=2
set cursorcolumn
set cursorline

" }}}

" Tab and indent behaviour {{{1

set autoindent
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set smarttab
set expandtab
set cino=N-s,(s,us,U1
set completeopt=menuone,preview
set formatoptions=crqln1
set showmatch
set listchars=tab:\|\ ,extends:❯,precedes:❮,trail:␣
"set listchars=tab:→_,eol:¬,extends:❯,precedes:❮,trail:␣
set nolist
set conceallevel=0

" }}}

" Backup, Undo and Swap file {{{1
if has('persistent_undo')
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/media/truecrypt*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/media/truecrypt*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/media/truecrypt*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/media/truecrypt*
                \ setlocal viminfo=
        augroup END
    endif
endif

" }}}

" Add the virtualenv's site-packages to vim path {{{

if has('python')
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
endif
" }}}
