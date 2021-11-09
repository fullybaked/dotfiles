" Better nav with tmux see https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" Run commands in a tmux split
Plug 'christoomey/vim-tmux-runner'
let g:VtrDetachedName = "detached"
let g:VtrPercentage = 15

nmap <silent> <C-e>o :VtrOpenRunner<cr>
nmap <silent> <C-e>f :VtrFocusRunner<cr>
nmap <silent> <C-e>a :VtrAttachToPane<cr>
nmap <silent> <C-e>d :VtrSendCtrlD<cr>
nmap <silent> <C-e>c :VtrClearRunner<cr>
vmap <silent> <C-e>c :VtrClearRunner<cr>
nmap <silent> <C-e>x :VtrKillRunner<cr>
nmap <silent> <C-e>e :VtrSendLinesToRunner<cr>
" need this one in visual mode for visually highlighted code blocks
vmap <silent> <C-e>e :VtrSendLinesToRunner<cr>
