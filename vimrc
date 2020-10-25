set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
call plug#end()

filetype plugin indent on
syntax on


set scrolloff=1
set shiftwidth=4    "Set number of spaces per auto indentation
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent     "Do smart autoindenting when starting a new line
set smarttab        "At <Tab> at beginning line inserts spaces set in shiftwidth
"set mouse=n "enable mouse in normal mode only
set autoread
set ignorecase
set smartcase
set incsearch
set nohlsearch

set nowrap
set hidden
set nu
set laststatus=2
set statusline=
set statusline+=\ %F%m%= 
set statusline+=\ %y
set statusline+=\ (%{&fileencoding?&fileencoding:&encoding}\,%{&fileformat})
set statusline+=\ Buf:%2n,col:%2c,%3l\/%L\ %2P
set showcmd
set history=100

" mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set path+=**

set wildmenu
set wildmode=longest:list,full
set wildignore=*/build/*,*.o,*.pyc,*.class
set wildignore+=*/.git/**/*
set wildignore+=tags,.tags
set wildignore+=*.tar.*
"set wildignorecase
"set complete+=kspell

set pumheight=10
"set completeopt=menuone,longest
set tags+=~/.systags

" netrw options
let g:netrw_banner = 0
"let g:netrw_browse_split = 4

let $BASH_ENV = "~/.bash_aliases"   "enable bash aliases in vim too

"-------------- AUTO-COMMANDS --------------------------

" save and reload folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

autocmd Filetype vimrc setlocal omnifunc=syntaxcomplete#Complete
autocmd BufRead,BufNewFile Makefile* setlocal noexpandtab

" deletes netrw's buffer once it's hidden
autocmd FileType netrw setl bufhidden=delete 

au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

"--------- MAPPINGS ------------------------
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <silent> <F3> :set hlsearch!<CR>
"nnoremap <silent> <F3> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"autocmd FileType c,cpp nnoremap <F5> :silent make %:r \|:redraw!\|cc<CR>

let mapleader=","
nnoremap    <silent> <Leader>b   :ls<CR>:b<Space>
nnoremap    <Leader>W   :w !sudo tee % > /dev/null

"--------------------- COMMANDS ----------------------
command! Tags       !ctags -R .
command! TagsSystem !~/bin/systags
command! WikiUpdate !~/git/notes/site_rebuild.sh

"--------------------- FUNCTIONS ----------------------
function! RunMake()
  if filereadable("./Makefile") || filereadable("./makefile")
    silent make
    cc 
  elseif (&filetype == "cpp")
    silent make %:r 
    redraw!
    cc
  endif
endfunction
nmap <silent> <F5> :call RunMake()<CR>

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction
nmap <silent> <F4> :call SwitchSourceHeader()<CR>

"--------------------- UI ----------------------------

" for syntax c.vim and cpp.vim
let g:cpp_function_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_posix_standard = 1

" for syntax cpp.vim
let g:cpp_class_scope_highlight = 0
let g:cpp_class_decl_highlight = 1
 
" for syntax python.vim
"let g:python_highlight_all=1

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }


" GNU SCREEN
" for screen use folowing
" colorescheme default
" do not set termguicolors

" TMUX
" needed for true colors inside tmux
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

colorscheme PaperColor

if has("gui_running")
    set background=light
    "colorscheme morning

    "set cursorline
    "autocmd WinEnter * setlocal cursorline
    "autocmd WinLeave * setlocal nocursorline
    "hi CursorLine guibg=#dadada
else
    "colorscheme molokai
    "highlight Pmenu ctermbg=grey guibg=grey
    "highlight PmenuSel ctermbg=white guibg=white
    "highlight LineNr ctermfg=darkgrey ctermbg=none
endif


