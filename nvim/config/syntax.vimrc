" Syntax checking - if we're in nvim then use Neomake
"
if has('nvim')

  " Syntax checking, among other things
  call minpac#add('neomake/neomake')

  " Run NeoMake on read and write operations
  autocmd! BufReadPost,BufWritePost * Neomake

  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1

endif
