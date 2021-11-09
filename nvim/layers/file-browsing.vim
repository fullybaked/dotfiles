" --------------------------------------------------
" File/Directory browser
" --------------------------------------------------
" Better netrw for directory stuff
Plug 'tpope/vim-vinegar'
let g:netrw_liststyle = 1 " Detail View
let g:netrw_sizestyle = "H" " Human-readable file sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
let g:netrw_hide = 1 " hide dotfiles by default
let g:netrw_banner = 0 " Turn off banner

" open current dir in netrw
nnoremap <silent> <C-b> :Explore!<cr>
" noop the dash button to stop me fat-fingering it and dropping into netrw
nnoremap - <Nop>


" vim:ft=vim
