call minpac#add('rking/ag.vim')

map <C-f> :Ag!<space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
endif
