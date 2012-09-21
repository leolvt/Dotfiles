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
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'kevinw/pyflakes-vim' " -> syntastic
"Bundle 'mileszs/ack.vim'
 
" Plugins from vim-scripts.org
Bundle 'scratch.vim'
Bundle 'TaskList.vim'
"Bundle 'Rainbow-Parenthesis' "kien/rainbow_parentheses.vim 
"Bundle 'pep8' " -> Syntastic

