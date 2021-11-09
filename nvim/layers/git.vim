" --------------------------------------------------
"  Git
" --------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'
Plug 'knsh14/vim-github-link'
Plug 'kdheepak/lazygit.nvim'

autocmd FileType gitcommit set spell
autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit

nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gp :Git push -u<CR>
nnoremap <silent> <Leader>gf :Git push -u --force<CR>
nnoremap <silent> <Leader>gb :GBranches<cr>
nnoremap <silent> <Leader>gg :LazyGit<CR>
nnoremap <silent> <Leader>gl :GetCurrentBranchLink<CR>


" Assumes you have setup the following as a git alias in $HOME/.gitconfig
" [prlog = "!f() { git log ${1:-develop}..HEAD --reverse --no-merges --pretty='---%n%n**%s** (%h)%n%n%b'; }; f"]
command! InsertPrlog read !git prlog
command! CopyPrlog !git prlog | pbcopy
nnoremap <silent> <Leader>gli :InsertPrlog<cr>
nnoremap <silent> <Leader>glc :CopyPrlog<cr>

" vim:ft=vim
