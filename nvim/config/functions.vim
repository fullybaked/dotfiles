function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()<cr>


function! AutoMakeDir(dir, force)
  if !isdirectory(a:dir)
        \   && (a:force
        \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
" Auto-create directory if it doesn't exist
" :w - will ask to create the dir
" :w! - will force create the dir
" https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save/42872275#42872275
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call AutoMakeDir(expand('<afile>:p:h'), v:cmdbang)
augroup END
" vim:ft=vim
