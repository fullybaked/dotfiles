" fuzzy finder - CtrlP replacement (requires the Go binary via homebrew / source
" https://github.com/junegunn/fzf)
"
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')

map <C-t>f :FZF<cr>
map <C-t>h :History<cr>
map <C-t>t :Tags<cr>

