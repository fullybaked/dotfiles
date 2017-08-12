call minpac#add('stanangeloff/php.vim')

autocmd FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
autocmd FileType php setlocal formatoptions+=cro
autocmd FileType php setlocal expandtab sw=4 sts=4 ts=4
autocmd FileType php :set foldmethod=syntax
autocmd FileType php :set foldlevel=1
let g:phpcomplete_index_composer_command='/usr/local/bin/composer'

