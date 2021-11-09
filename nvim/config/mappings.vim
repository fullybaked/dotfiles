
"  Leader must be set before any leader mappings as it is bound at runtime
let mapleader = "\<Space>"
let maplocalleader = ","

" Easier escaping from home row
inoremap <silent> jj <Esc>
inoremap <silent> jk <Esc>
inoremap <silent> kj <Esc>

" Bounce between two buffers
nnoremap <leader><leader> <c-^>

" Turn off linewise keys, always move up/down one line even if wrapped
nnoremap <silent> j gj
nnoremap <silent> k gk

" Make Y act like D and C, yank to end of current line
nnoremap <silent> Y y$

" This will run the macro in q register
nnoremap Q @q

" Use Ctrl-c, to Esc out of any mode
nnoremap <C-c> <Esc>:noh<CR>
vnoremap <C-c> <Esc>gV
onoremap <C-c> <Esc>
cnoremap <C-c> <C-c>
inoremap <C-c> <Esc>

" Clean trailing whitespace
nnoremap <silent> <Leader>ws :%s/\s\+$//e<cr>

" Open my vimrc in a new tab
nnoremap <silent> <Leader>i :tabedit $MYVIMRC<cr>

" Readline bindings in the command line from `:h emacs-keys`
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Del>
cnoremap <C-e>  <End>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <C-g>  <C-c>
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>

" %% expands to the path of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>e :edit %%
nmap <leader>v :view %%

" Jump between panes a little easier
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Skim through open buffers
nmap <C-p> :bprev<cr>
nmap <C-n> :bnext<cr>

" Better tab keys
nmap <Leader>to :tabnew<cr>
nmap <Leader>te :tabedit %<cr>
nmap <Leader>tc :tabclose<cr>
nmap <Leader>tn :tabnext<cr>
nmap <Leader>tp :tabprev<cr>

" Short cut to splits (\ is the | without a shift)
nnoremap <silent> <Leader>\ :vsp<cr>
nnoremap <silent> <Leader>- :split<cr>
nnoremap <silent> <Leader>= :wincmd =<cr>
