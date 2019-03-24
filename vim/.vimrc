" Mappings
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>
nmap 0 ^
nmap <enter> o<esc><UP>
nmap KB :NERDTreeToggle<CR>
imap jk <esc> :w<cr> 
imap kj <esc> :w<cr> 

" NERDCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

map <Leader>cc <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>

command! Q q

set number
set expandtab
set tabstop=2
set shiftwidth=2

set encoding=utf8
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

set noshowmode

filetype plugin indent on

" Close NERDTree window
let g:ctrlp_dont_split = 'NERD'


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

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>

" File type specific rules
autocmd FileType go setlocal tabstop=8 shiftwidth=8 

" Initialize plugin system
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'bcicen/vim-vice'
Plug 'dunckr/vim-monokai-soda', { 'as': 'monokai-soda' }
Plug 'reewr/vim-monokai-phoenix', { 'as': 'monokai-phoenix' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'slim-template/vim-slim'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'pbrisbin/vim-mkdir'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'


call plug#end()

" Enable react syntax highlighting and indenting for .js files
let g:jsx_ext_required = 0

" Colorscheme
  syntax on
  "  colorscheme monokai
  " coloscheme monokai-phoenix
  colorscheme monokai-soda
  set termguicolors


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

