" Tools for general coding regardless of the language
"
call minpac#add('janko-m/vim-test')                 " Test all the things - in editor test runner
let g:test#strategy='neoterm'
let g:test#preserve_screen = 1

call minpac#add('rizzatti/dash.vim')
nnoremap <silent> <Leader>d <Plug>DashSearch
