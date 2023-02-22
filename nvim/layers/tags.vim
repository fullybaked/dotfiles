" --------------------------------------------------
" CTags & Tagbar
" Requires universal-ctags to be installed
" https://github.com/universal-ctags/homebrew-universal-ctags
" --------------------------------------------------

Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_width = 70

let g:gutentags_ctags_tagfile='.git/tags'
let g:gutentags_ctags_executable='ptags'

map <C-m> :TagbarToggle<CR>
