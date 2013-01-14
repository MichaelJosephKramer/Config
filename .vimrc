"VIM compatibility
set nocompatible

"Vundle Configuration
filetype off

set rtp+=~/Config/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-vividchalk'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wincent/Command-T'

filetype indent plugin on

"Map leader key
let mapleader = ","
let maplocalleader = "/"

"Remap kj to ESC
inoremap kj <Esc>

"Remap F2 to NERDTreeToggle
nnoremap <silent> <F2> :NERDTreeToggle<CR>

"Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

"View compiled CoffeeScript
vnoremap <silent> <localleader>c :CoffeeCompile<CR>

syntax on
:silent! colorscheme vividchalk

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

" Commant-T terminal settings
set ttimeoutlen=50

if &term =~ 'xterm' || &term =~ 'screen'
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" Set cursor to change in edit mode in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
