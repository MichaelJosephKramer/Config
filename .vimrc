"VIM compatibility
set nocompatible

"Pathogen Configuration
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype indent plugin on

"Map leader key
let mapleader=","

"Remap ;; to ESC
imap ;; <Esc> 

"Remap F2 to NERDTreeToggle
map <silent> <F2> :NERDTreeToggle<CR>

colorscheme vividchalk

syntax on

set nobackup

set hidden
set number 
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch
set cul
set cursorcolumn
set scrolloff=10
set showcmd

set autoread
set ruler

set incsearch
set ignorecase
set smartcase
set visualbell 

" Path/File Expansion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~

" Status Line
set ls=2
set statusline=\ %t\ %y\ Line:\ %l/%L:%c

" CoffeeScript commands
autocmd BufWritePost *.coffee silent CoffeeMake! | cwindow

" JSON syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" Move swap files
if has("win32")
   set directory=$TMP
else
   set directory=/tmp
end
