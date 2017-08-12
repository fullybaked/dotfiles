" C-Tags browser
" Requires universal-ctags to be installed https://github.com/universal-ctags/homebrew-universal-ctags
"
call minpac#add('majutsushi/tagbar')
call minpac#add('universal-ctags/ctags')

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1

map <C-m> :TagbarToggle<CR>
