" Mappings
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>
nmap 0 ^
nmap <enter> o<esc><UP>
nmap KB :NERDTreeToggle<CR>

nmap <silent> <C-p> :Files<enter>
nmap <silent> <C-g> :GFiles<enter>
nmap <silent> <C-o> :Buffers<enter>
" nmap \ :Rg<SPACE>
nmap <C-f> :Rg<SPACE>

imap jk <esc> :w<cr>
imap kj <esc> :w<cr>

" paste multiple times

xnoremap p pgvy


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
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

set noshowmode

filetype plugin indent on


" Close NERDTree window
" let g:ctrlp_dont_split = 'NERD'

" The Silver Searcher
" if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
" endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" File type specific rules
autocmd FileType go setlocal tabstop=8 shiftwidth=8

" Initialize plugin system
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'bcicen/vim-vice'
Plug 'dunckr/vim-monokai-soda', { 'as': 'monokai-soda' }
Plug 'reewr/vim-monokai-phoenix', { 'as': 'monokai-phoenix' }
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
Plug 'jremmen/vim-ripgrep'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pseewald/vim-anyfold'


" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wookayin/fzf-ripgrep.vim'


" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'


call plug#end()

" Fold
filetype plugin indent on " required
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes

" set foldlevel=0  " close all folds
" or
set foldlevel=99 " Open all folds

" Remove whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save = 1


" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>



" Enable react syntax highlighting and indenting for .js files
let g:jsx_ext_required = 0

" Colorscheme
  syntax on
  "  colorscheme monokai
  " coloscheme monokai-phoenix
  colorscheme monokai-soda
  set termguicolors

" nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Enable fzf
set rtp+=/opt/homebrew/opt/fzf
