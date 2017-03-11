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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


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
