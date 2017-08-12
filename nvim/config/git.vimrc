" Git
"
call minpac#add('tpope/vim-fugitive')               " Fugitive. You know, for Git!
call minpac#add('airblade/vim-gitgutter')           " Show git status on individual lines/hunks
call minpac#add('Xuyuanp/nerdtree-git-plugin')      " Add git status to nerdtree

nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
nnoremap <silent> <Leader>gi :Git add -p %<CR>
nnoremap <silent> <Leader>br :Git checkout -b
