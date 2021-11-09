" --------------------------------------------------
" Status bar stuff - must come AFTER colorscheme
" --------------------------------------------------
"
"
" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={
      \ 'n' : 'Normal ',
      \ 'no' : 'N-Operator Pending ',
      \ 'v' : 'Visual ',
      \ 'V' : 'V-Line ',
      \ '^V' : 'V-Block ',
      \ 's' : 'Select ',
      \ 'S': 'S-Line ',
      \ '^S' : 'S-Block ',
      \ 'i' : 'Insert ',
      \ 'R' : 'Replace ',
      \ 'Rv' : 'V-Replace ',
      \ 'c' : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r' : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!' : 'Shell ',
      \ 't' : 'Terminal '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! CurrentMode() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V-Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! CurrentBranch() abort
  let l:currentbranch = FugitiveHead()
  if l:currentbranch == ""
    return ""
  endif

  return "~" . l:currentbranch
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

autocmd ColorScheme * hi User1 ctermbg=darkgreen ctermfg=black
autocmd ColorScheme * hi User2 ctermbg=darkred ctermfg=black
hi User1 ctermbg=darkgreen ctermfg=black
hi User2 ctermbg=darkred ctermfg=black
set statusline=
set statusline+=%2*%h%m%r%w
set statusline+=%1*[%{LinterStatus()}]
set statusline+=%1*\ %{CurrentMode()}%*
set statusline+=\ %f\ %y
set statusline+=%{CurrentBranch()}
set statusline+=%=\ (%l,%c)
set statusline+=\ [%P\ of\ %4L]

" vim:ft=vim
