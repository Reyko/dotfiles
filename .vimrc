nmap 0 ^
imap jk <esc> :w<cr> 
imap kj <esc> :w<cr> 

command! Q q

set number
set expandtab
set tabstop=2
set shiftwidth=2

" Initialize plugin system
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()
