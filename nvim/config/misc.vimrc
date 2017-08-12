
runtime macros/matchit.vim                         " Enable extended % matching

call minpac#add('tpope/vim-surround')               " Surrounding characters (ludicrously useful)
call minpac#add('tpope/vim-unimpaired')             " Pairs of handy bracket mappings
call minpac#add('tpope/vim-repeat')                 " Repeat plugin actions (e.g., from vim-surround, vim-unimpaired)
call minpac#add('tpope/vim-endwise')                " Automatically enter closing tokens (e.g., 'end' in Ruby)
call minpac#add('raimondi/delimitmate')             " Auto close quote, parens, braces etc
call minpac#add('tpope/vim-vinegar')                " Better netrw for directory stuff
call minpac#add('christoomey/vim-tmux-navigator')   " Better nav with tmux see https://github.com/christoomey/vim-tmux-navigator
call minpac#add('tpope/vim-commentary')             " Easy line commenting
call minpac#add('sheerun/vim-polyglot')             " Better syntax highlighting support

" force a sudo write on file via :W
command! W w !sudo tee % >/dev/null

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" System Clipboard Support
if (has('clipboard'))
    if (has('unnamedplus')) " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else " if not, use the * register for copy-paste
        set clipboard=unnamed
    endif
endif

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/dave', "~", "g")
  return curdir
endfunction
