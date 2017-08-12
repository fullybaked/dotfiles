" Tabularize - for easier alignments
"
"
"
call minpac#add('godlygeek/tabular')

nmap <Leader>a= :Tabularize /=<CR>    " align =
vmap <Leader>a= :Tabularize /=<CR>    " algin =
nmap <Leader>ah :Tabularize /=><CR>   " align =>
vmap <Leader>ah :Tabularize /=><CR>   " align =>
nmap <Leader>a: :Tabularize /:\zs<CR> " align to :<space>
vmap <Leader>a: :Tabularize /:\zs<CR> " align to :<space>
nmap <Leader>a" :Tabularize /"<CR>    " align to "
vmap <Leader>a" :Tabularize /"<CR>    " align to "
