" Ruby and Rails specific set up for my Neovim config

" Ruby / Rails Plugins
call minpac#add('kchmck/vim-coffee-script')         " Coffee script support
call minpac#add('tpope/vim-rails')                  " Rails tools
call minpac#add('t9md/vim-ruby-xmpfilter')          " Inline ruby execution using #=>

" Better block level motions in Ruby
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')

" Enable compiler support for ruby
compiler ruby

autocmd FileType ruby :set foldmethod=syntax
autocmd FileType ruby :set foldlevel=1

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>R <Plug>(xmpfilter-run)
