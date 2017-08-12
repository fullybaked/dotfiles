" Better window, split and buffer management

call minpac#add('jlanzarotta/bufexplorer')          " Buffer Explorer, interactive buffer view

nnoremap <silent> <Leader>bb :ToggleBufExplorer<CR>

" Short cut to splits (\ is the | without a shift)
nnoremap <silent> <Leader>\ :vsp<cr>

nnoremap <silent> <Leader>- :split<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>/ :wincmd _<cr>:wincmd \|<cr>
nnoremap <Leader>= :wincmd =<cr>

" easier split resizing with cursor keys
map <C-Left> <C-w><
map <C-Right> <C-w>>
map <C-Up> <C-w>-
map <C-Down> <C-w>+

" easier quit buffer
map <C-q> :q<CR>
" easier save buffer
map <C-s> :w<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
