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
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
"Bundle 'Pychimp/vim-luna'
"Bundle 'sjl/badwolf'
"Bundle 'noah/vim256-color'
" }}}

" Vim Editor and interface features {{{1
Bundle 'Yggdroot/indentLine'
Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'g3orge/vim-voogle'
Bundle 'kien/ctrlp.vim'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'mhinz/vim-signify'
Bundle 'mhinz/vim-startify'
Bundle 'milkypostman/vim-togglelist'
Bundle 'mutewinter/GIFL'
Bundle 'mutewinter/swap-parameters'
Bundle 'rking/ag.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'troydm/easybuffer.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'msanders/snipmate.vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
"Bundle 'mbbill/undotree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

Bundle 'HelpClose'
Bundle 'IndexedSearch'
Bundle 'TaskList.vim'
Bundle 'ZoomWin'
Bundle 'scratch.vim'
" }}}

" Language specific bundles {{{1

" Python {{{ 2
Bundle 'klen/python-mode'
" }}}

" Perl {{{
Bundle 'vim-perl/vim-perl'
" }}}

" HTML/CSS {{{2
Bundle 'mattn/emmet-vim'
" }}}

" GLSL {{{2
Bundle 'Nemo157/glsl.vim'
" }}}

" Markdown {{{
Bundle 'tpope/vim-markdown'
" }}}

" C/C++ {{{
Bundle 'std_c.zip'
"Bundle 'aftersyntaxc.vim'
" }}}

" }}}

" Git Integration {{{1
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
" }}}

" Integration and tools {{{1
Bundle 'benmills/vimux'
Bundle 'mattn/webapi-vim'
Bundle 'tpope/vim-eunuch'
" }}}

""Bundle 'alfredodeza/pytest.vim'
""Bundle 'fs111/pydoc.vim'

" Activate filetype and indent
filetype plugin indent on
