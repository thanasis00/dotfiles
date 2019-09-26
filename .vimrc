" Put your non-Plugin stuff after this line
set showcmd             " Show (partial) command in status line.  
set showmatch           " Show matching brackets.                 
set ignorecase          " Do case insensitive matching            
set smartcase           " Do smart case matching                  
set incsearch           " Incremental search                      
set autowrite           " Automatically save before commands like :next and :make  
set hidden              " Hide buffers when they are abandoned                 
set mouse=v             " Enable mouse usage (all modes)                     
set autoindent
set autoread            " reload files when changed on disk, i.e. via `git checkout`
set number
set cursorline
set noshowmode          " Hide the default mode text below statusline
hi CursorLine term=bold cterm=bold guibg=Grey40
syntax on
set nocompatible                                                           
"set number             "show line numbers                                 
set ruler               " set file stats                                 
set visualbell          "set blink cursor on error instead of beeping   
set encoding=utf-8
" Whitespace
set wrap
set textwidth=79                        
set formatoptions=tcqrn1                                                 
set tabstop=2                     
set shiftwidth=2                             
set softtabstop=2                                       
set expandtab                                               
set noshiftround 
highlight ExtraWhitespace ctermbg=black guibg=black
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"set statusline+=%F
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
let g:indentLine_color_term = 239
