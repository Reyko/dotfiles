" Mappings
nmap 0 ^
nmap <enter> o<esc>
imap jk <esc> :w<cr> 
imap kj <esc> :w<cr> 

command! Q q

set number
set expandtab
set tabstop=2
set shiftwidth=2

filetype plugin indent on

" File type specific rules
autocmd FileType go setlocal tabstop=8 shiftwidth=8 

" Initialize plugin system
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'bcicen/vim-vice'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'

call plug#end()

" Colorscheme
  colorscheme vice
