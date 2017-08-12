" Various key mappings that are not related specifically to plugins and
" could be shared with a normal vim setup
let mapleader = ","
inoremap <silent> jj <Esc>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> Y y$
nnoremap <silent> <Leader>h :nohl<cr>
nnoremap <silent> <Leader><Enter> o<ESC>
nnoremap <silent> <Leader>q :enew<cr>
nnoremap <silent> <Leader>vi :vs $MYVIMRC<cr>
nnoremap <silent> <Leader>W :set wrap<cr>
nnoremap <silent> <Leader>w :set nowrap<cr>

nnoremap <silent> <Leader>j v%

" neovim specific mappings are all wrapped in a handler so they only
" take effect if we're running Neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  nnoremap <Leader>t :Topen<CR>
endif
