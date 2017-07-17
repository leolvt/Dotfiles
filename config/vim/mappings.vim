" MAPPINGS
" --------

" Mappings for vim's stuff {{{

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Yank from current cursor position to end of line
map Y y$

" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <Leader>yo "+y

" Paste content from OS's clipboard
nnoremap <Leader>po "+p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap <C-k> <Esc>

" toggle some options
nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use <Leader>z to "focus" the current fold.
nnoremap <Leader>z zMzvzz

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" }}}

" Plugin Mappings {{{

" MiniBufferExplorer {{{2
"map <Leader>mbe :MBEOpen<cr>
"map <Leader>mbc :MBEClose<cr>
"map <Leader>mbt :MBEToggle<cr>
"noremap <C-TAB>   :MBEbf<CR>
"noremap <C-S-TAB> :MBEbb<CR>

" }}}

" Tagbar {{{2
nmap <F8> :TagbarToggle<CR>
" }}}

" NERDTree {{{2
nmap <Leader>nt :NERDTreeToggle<CR>
" }}}

" Gundo {{{2
nmap <F6> :GundoToggle<CR>
" }}}

" Syntastic {{{2
nmap <F5> :SyntasticCheck<CR>
" }}}

" }}}


