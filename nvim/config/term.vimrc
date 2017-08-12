" Configure up some preferred settings for Neovim terminal emulator

if has('nvim')
  " Wrapper around neovim terminal for nicer interface
  call minpac#add('kassio/neoterm')

  " Key mappings for terminal
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
