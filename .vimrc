"VIM compatibility
set nocompatible

"Pathogen Configuration
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype indent plugin on

"Map leader key
let mapleader = ","
let maplocalleader = "/"

"Remap ;; to ESC
inoremap ;; <Esc>

"Remap F2 to NERDTreeToggle
nnoremap <silent> <F2> :NERDTreeToggle<CR>

"Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

"View compiled CoffeeScript
vnoremap <silent> <localleader>c :CoffeeCompile<CR>

colorscheme vividchalk

syntax on

"Remove splash screen
set shortmess+=I

"I don't need the help
noremap <F1> <ESC>

set nobackup
set nowritebackup

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
set backspace=indent,eol,start

" Path/File Expansion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~

" Status Line
set ls=2
set statusline=\ %t\ %y\ Line:\ %l/%L:%c

" additonal syntax highlighting
augroup syntax 
  autocmd!
  autocmd BufNewFile,BufRead *.json setfiletype javascript
  autocmd BufNewFile,BufRead *.rabl setfiletype ruby
augroup end

" Comments
augroup comments
  autocmd!
  autocmd FileType coffee,ruby nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup end

" Move swap files
if has("win32")
   set directory=$TMP
else
   set directory=/tmp
end
