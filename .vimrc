filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off

" Load plugins
call plug#begin('~/.vim/plugged')
  Plug 'nanotech/jellybeans.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  Plug 'jwalton512/vim-blade'
  Plug 'romainl/vim-cool'
  Plug 'qpkorr/vim-bufkill'
  Plug 'terryma/vim-multiple-cursors'
"  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"  Plug 'junegunn/fzf.vim'
"  Plug 'tpope/vim-commentary'
"  Plug 'christoomey/vim-tmux-navigator'
"  Plug 'raimondi/delimitmate'
"  Plug 'cocopon/lightline-hybrid.vim'
call plug#end()

syntax on
set nocompatible
set clipboard=unnamed " yank and paste with the system clipboard
filetype plugin indent on

" Editing preferences
set autoindent
set autoread    " reload files when changed on disk, i.e. via `git checkout` 
set autowrite " Autowrite when several commands occur ( e.g. :make :next etc.)
set encoding=utf-8  " encoding preference
set expandtab   " expand tabs to spaces
set smartcase     " case-sensitive search if any caps
set softtabstop=2   " insert mode tab and backspace use 2 spaces
set tabstop=2     " actual tabs occupy 8 characters
set shiftwidth=2
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/logs,*/target,*/node_modules,*/bower_components " ignores misc. files
let g:ag_working_path_mode="r"
set hidden

" Backup/Swap/Undo/Saving
set undolevels=2000
set undodir=/tmp// " Save undo to /tmp so everything gets deleted upon reboot
set undofile " Enable persistent undo ( writes to disk )
set noswapfile " Disable swap files
set nobackup " Do not create annoying backup files
set history=9000

" Searching preferences
set ignorecase " case-insensitive search
set incsearch " search as you type

" Visual settings
set number    " Show row numbers
set cursorline    " Highlight current line
set gfn=Inconsolata-dz\ for\ Powerline:h13
set noshowmode    " Hide the default mode text below statusline
set laststatus=2
set list    " show trailing whitespace
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
set guioptions+=c " supresses popup messages in the statusline (macvim)
set guioptions-=L " no left scrollbar
set guioptions-=r " no right scrollbar
set guioptions-=R

" Splits
set splitright " Split right of the current window
set splitbelow " Split below current window

" Nerdtree
let NERDTreeShowHidden=1

" Open NERDTree when opening a directory with vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Toggling NERDTree
nmap <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" Open files/folders with 'l'
" And open recursively with Space
let g:NERDTreeMapActivateNode="l"
let g:NERDTreeMapOpenRecursively="<Space>"

" Statusline {
let g:lightline = {}
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineGetCwd',
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
function! LightlineGetCwd()
    return expand('%:h') !=# '' ? expand('%:h') : '[No Name]'
endfunction
set showtabline=2

" lightline-bufferline
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#min_buffer_count=0
let g:lightline#bufferline#filename_modifier=":p:t"

" Keyboard shortcuts
let mapleader = ','
nnoremap / /\v
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-a> :b
nnoremap ; :
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

"Use <Space> to go half-page down
nnoremap <Space> <c-d>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

colorscheme jellybeans
