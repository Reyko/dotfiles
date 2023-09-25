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
nmap <C-f> :RgRaw<SPACE>

imap jk <esc> :w<cr>
imap kj <esc> :w<cr>

" paste multiple times

xnoremap p pgvy


" NERDCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'purify'
      \ }

map <Leader>cc <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>

command! Q q

set hlsearch
set number
set expandtab
set tabstop=2
set shiftwidth=2

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

set noshowmode

filetype plugin indent on


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
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'bcicen/vim-vice'
Plug 'dunckr/vim-monokai-soda', { 'as': 'monokai-soda' }
Plug 'reewr/vim-monokai-phoenix', { 'as': 'monokai-phoenix' }
Plug 'kyoz/purify', { 'rtp': 'vim', 'as': 'purify' }
Plug 'NLKNguyen/papercolor-theme', { 'as': 'papercolor' }
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'slim-template/vim-slim'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'preservim/nerdtree'
Plug 'pbrisbin/vim-mkdir'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jremmen/vim-ripgrep'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pseewald/vim-anyfold'
Plug 'pechorin/any-jump.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'wookayin/fzf-ripgrep.vim'
Plug 'jesseleite/vim-agriculture'

" React
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'


call plug#end()

" Coc

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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


" set background=dark
" Colorscheme
  " syntax on
  "  colorscheme monokai
  " coloscheme monokai-phoenix
  " colorscheme monokai-soda
  " colorscheme purify
" set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme papercolor
" set termguicolors

" nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Enable fzf
set rtp+=/opt/homebrew/opt/fzf

" Search with directories
" function! RG(fullscreen, ...)
    " let l:pat = ''
    " let l:dir = expand("%:p:h")
    " if a:0 > 0
        " let l:args = split(a:1)
        " let l:pat = l:args[0]
        " if len(l:args) > 1
            " let l:dir = l:args[1]
        " endif
    " endif
    " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    " let initial_command = printf(command_fmt, l:pat.' '.l:dir)
    " let reload_command = printf(command_fmt, '{q}'.' '.l:dir)
    " let spec = {'options': ['--phony', '--query', l:pat, '--bind', 'change:reload:'.reload_command]}
    " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
" command! -bang -nargs=? -complete=dir RG call RG(<bang>0, <f-args>)


" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    " \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
