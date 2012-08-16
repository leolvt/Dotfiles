" ==========================
" Vundle :  Manages plugins
" ==========================

filetype off " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle!
Bundle 'gmarik/vundle'

" Let Vundle manage the plugins we want!

" Plugins directly from github
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
"Bundle 'ervandew/supertab'
Bundle 'kevinw/pyflakes-vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'Rip-Rip/clang_complete'
 
" Plugins from vim-scripts.org
"Bundle 'clang-complete'
Bundle 'scratch.vim'
Bundle 'Rainbow-Parenthesis'
Bundle 'pep8'
Bundle 'TaskList.vim'

