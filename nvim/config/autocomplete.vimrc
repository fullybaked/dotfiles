
call minpac#add('Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'})
call minpac#add('Shougo/neosnippet.vim')
call minpac#add('Shougo/neosnippet-snippets')

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set completeopt=longest,menuone

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
