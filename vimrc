

set nocompatible              " be iMproved, required

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'python-mode/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required




set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

set ignorecase
set smartcase

set mouse=""
set hidden
set number
set cursorline
set termguicolors
set history=300
set cmdheight=2 "The commandbar height
set ls=2        "always show filename
set showcmd	" Show (partial) command in status line.
set showmatch   " Show matching bracets when text indicator is over them
set mat=2       " How many tenths of a second to blink
set pumheight=5 " Limit popup menu height 
set completeopt=menuone,longest

"set autochdir	" automatically change window's cwd to file's dir
set autoread 	" Set to auto read when a file is changed from the outside
set autowrite	" Automatically save before commands like :next and :make

" Turn backup off and undo file
set nobackup
set noswapfile
set noundofile

set wildmenu
"set wildmode=list:longest,full
set wildmode=longest:list,full

set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

set omnifunc=syntaxcomplete#Complete

set dictionary=/usr/share/dict/words
" set complete+=k "the word completion will also use dictionary

set path+=**



set statusline=
set statusline+=%<%F                                    "show full file path 
set statusline+=%m%r%h                                  "modified, read-only, help-file
set statusline+=%=%y                                    "file type
set statusline+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]  "encoding, file-format
set statusline+=\ %c\ %l/%L\ %P                         "column, line, file length, file percent


nnoremap <C-l> :nohl<CR><C-l>
nnoremap gb :ls<CR>:b<Space>

nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

"Skip entire parts of the project and find files recursively under the directory of the current file:
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>

autocmd FileType c nnoremap <F5> :silent make %:r \|:redraw!\|cc<CR>


"let g:solarized_termcolors=256
let python_highlight_all=1

let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 120



colorscheme codeschool
filetype indent plugin on
syntax enable

