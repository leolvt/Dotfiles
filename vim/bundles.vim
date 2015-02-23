" ==========================
" Vundle :  Manages plugins
" ==========================

" Required stuff to set up Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle!
Bundle 'gmarik/vundle'

" Themes {{{1
"Bundle 'Pychimp/vim-luna'
"Bundle 'noah/vim256-color'
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/256-jungle'
Bundle 'w0ng/vim-hybrid'
" }}}

" Vim Editor and interface features {{{1
Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'mutewinter/swap-parameters'
Bundle 'rking/ag.vim'
Bundle 'troydm/easybuffer.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'Yggdroot/indentLine'
"Bundle 'g3orge/vim-voogle'
"Bundle 'matthias-guenther/hammer.vim'
"Bundle 'mhinz/vim-signify'
"Bundle 'mhinz/vim-startify'
"Bundle 'mutewinter/GIFL'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'techlivezheng/vim-plugin-minibufexpl'
"Bundle 'msanders/snipmate.vim'
"Bundle 'garbas/vim-snipmate'

Bundle 'IndexedSearch'
Bundle 'TaskList.vim'
Bundle 'ZoomWin'
"Bundle 'HelpClose'
"Bundle 'scratch.vim'
" }}}

" Language specific bundles {{{1

" Python {{{ 2
"Bundle 'klen/python-mode'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'python.vim--Vasiliev'
" }}}

" Perl {{{
Bundle 'vim-perl/vim-perl'
" }}}

" HTML/CSS {{{2
Bundle 'mattn/emmet-vim'
" }}}

" GLSL {{{2
"Bundle 'Nemo157/glsl.vim'
" }}}

" Markdown {{{
Bundle 'tpope/vim-markdown'
" }}}

" C/C++ {{{
Bundle 'std_c.zip'
"Bundle 'aftersyntaxc.vim'
" }}}

" i3 {{{
Bundle 'PotatoesMaster/i3-vim-syntax'
" }}}

" LaTeX {{{
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
" }}}

" Git Integration {{{1
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
" }}}

" Integration and tools {{{1
Bundle 'tpope/vim-eunuch'
"Bundle 'benmills/vimux'
"Bundle 'mattn/webapi-vim'
" }}}

" Activate filetype and indent
filetype plugin indent on
