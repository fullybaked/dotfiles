" Colour settings and customisations
" includes matching trailing whitespace
"
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('chriskempson/base16-vim')

set t_Co=256
set bg=dark
colorscheme base16-oceanicnext

autocmd ColorScheme * hi VertSplit ctermbg=bg ctermfg=bg
autocmd ColorScheme * hi LineNr ctermbg=bg
autocmd ColorScheme * hi CursorLineNR cterm=bold ctermbg=8 ctermfg=15
autocmd ColorScheme * hi clear SignColumn
autocmd ColorScheme * hi GitGutterAdd ctermfg=green ctermbg=bg
autocmd ColorScheme * hi GitGutterChange ctermfg=yellow ctermbg=bg
autocmd ColorScheme * hi GitGutterDelete ctermfg=red ctermbg=bg
autocmd ColorScheme * hi GitGutterChangeDelete ctermfg=yellow ctermbg=bg

hi VertSplit ctermbg=bg ctermfg=bg
hi LineNr ctermbg=bg
hi CursorLineNR cterm=bold ctermbg=8 ctermfg=15
hi clear SignColumn
hi GitGutterAdd ctermfg=green ctermbg=bg
hi GitGutterChange ctermfg=yellow ctermbg=bg
hi GitGutterDelete ctermfg=red ctermbg=bg
hi GitGutterChangeDelete ctermfg=yellow ctermbg=bg

" Trailing whitespace sucks. Show it:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

