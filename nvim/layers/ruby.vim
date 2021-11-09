" --------------------------------------------------
" Ruby and Rails
" --------------------------------------------------
call dein#add('vim-ruby/vim-ruby')
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

call dein#add('tpope/vim-rails')

call dein#add('tpope/vim-rbenv')

call dein#add('tpope/vim-rake')

call dein#add('tpope/vim-bundler')

" Inline ruby execution using #=>
call dein#add('t9md/vim-ruby-xmpfilter')
let g:xmpfilter_cmd = "seeing_is_believing"
autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(seeing_is_believing-mark)
autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(seeing_is_believing-run)
autocmd FileType ruby nmap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)

" Better block level motions in Ruby
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')

" Jump to FactoryBot definitions
call dein#add('christoomey/vim-rfactory')

" Enable compiler support for ruby
compiler ruby

augroup ruby
  au!
  au FileType ruby set foldmethod=syntax
  au FileType ruby set foldlevel=1
  au FileType ruby nmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
  au FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)
  au FileType ruby iabbrev dbg require 'pry'; binding.pry
augroup end

" Use vim-rails :A for alternate file, but open in a vert-split buffer
nmap <Leader>a :vs <bar> A<cr>

" --------------------------------------------------
" Promote variable to let for minitest:spsc / rspec
" --------------------------------------------------
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" --------------------------------------------------
" Rails route completion with FZF
" https://blog.semanticart.com/2017/11/14/rails-route-completion-with-fzf-in-vim
" --------------------------------------------------
function! s:parse_route(selected)
  let l:squished = substitute(join(a:selected), '^\s\+', '', '')
  return split(l:squished)[0] . '_path'
endfunction

inoremap <expr> <C-x><C-r> fzf#complete({
  \ 'source': 'rake routes',
  \ 'reducer': '<sid>parse_route'})

" need to check if vim-tmux-runner is installed for these
nmap <silent> <C-e>b :VtrSendCommandToRunner bundle install<cr>
nmap <silent> <C-e>mm :VtrSendCommandToRunner bundle exec rails db:migrate<cr>
nmap <silent> <C-e>mt :VtrSendCommandToRunner bundle exec rails db:migrate RAILS_ENV=test<cr>
nmap <silent> <C-e>r :VtrSendCommandToRunner bundle exec rails console<cr>

" vim:ft=vim
"
