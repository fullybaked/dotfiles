" --------------------------------------------------
" Python setup
" --------------------------------------------------
" Language server
" Plug 'neovim/nvim-lspconfig'
" lua << EOF
"   local nvim_lsp = require 'lspconfig'
"   nvim_lsp.pyls.setup()
" EOF

" PEP8 checking
Plug 'nvie/vim-flake8'

" Better autoindent
Plug 'vim-scripts/indentpython.vim'

" Venv handling
Plug 'jmcantrell/vim-virtualenv'
let g:virtualenv_directory = $PWD

" Python code formatting
"g:black_virtualenv
Plug 'psf/black'
let g:black_skip_string_normalization = 1

" Add jedi completion support to Deoplete
Plug 'deoplete-plugins/deoplete-jedi'

" Enable poetry support
Plug 'petobens/poet-v'
let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 1


Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 1

nnoremap <silent> <Leader>o :call jedi#usages()<cr>

Plug 'fisadev/vim-isort'

Plug 'Glench/Vim-Jinja2-Syntax'
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
" vim:ft=vim
