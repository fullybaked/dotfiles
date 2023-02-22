runtime macros/matchit.vim

set timeout
set timeoutlen=500
Plug 'liuchengxu/vim-which-key'
nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>

nnoremap <silent> <Leader>j :%!jq '.'<CR>

" Surrounding characters (ludicrously useful)
Plug 'tpope/vim-surround'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Repeat plugin actions (e.g., from vim-surround, vim-unimpaired)
Plug 'tpope/vim-repeat'

" Automatically enter closing tokens (e.g., 'end' in Ruby)
Plug 'tpope/vim-endwise'

" Auto close quote, parens, braces etc
Plug 'raimondi/delimitmate'

" Easy line commenting
" `gc` on a visual selection or motion
" `gcc` for the current line only
Plug 'tpope/vim-commentary'

" Sort motion bound to `gs` (sort values in <textobject>)
Plug 'christoomey/vim-sort-motion'

" 3-in-1 word variants plugin - Abolish, Subvert, and coercion
Plug 'tpope/vim-abolish'

" See https://www.youtube.com/watch?time_continue=1&v=kB2zSdVXT7k
" Reorder parameters/arguments/dicts etc 
" :SidewaysLeft and :SidewaysRight
Plug 'AndrewRadev/sideways.vim'

" Split code to multi-line or return to single line
"   - gS to split a one-liner into multiple lines
"   - gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'

" Auto-rename of closing HTML/XML tags
Plug 'AndrewRadev/tagalong.vim'

" Switch items - true -> false.  But also switches dict styles in supported langs
" E.g.
" Ruby from {:foo => "bar" } to {foo: "bar"}
" Elixir from ["one", "two", "three"] to ~w(one two three)
" Also does Git rebase keywords
" pick->fixup->reword->edit->squash-> etc
Plug 'AndrewRadev/switch.vim'

" Adds a new verb bound to `gr` for "go-replace" which can be used with the normal motions
" Replaces the content/area of the motion with the default register
" Eg. griw
"
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'easymotion/vim-easymotion'

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif
