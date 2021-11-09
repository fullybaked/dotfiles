
" display relative line numbers, with absolute number for current line
set number
set numberwidth=5
set relativenumber

" toggle between relative/absolute line numbers for pairing
function! ToggleRelativeLineNumber()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
  endif

endfunction
nnoremap <Leader>n :call ToggleRelativeLineNumber()<cr>

" vim:ft=vim
