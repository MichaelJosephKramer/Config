" --- Leader ---

let g:mapleader = ","

" --- Core Mappings ---

nnoremap <F1> <ESC>
inoremap kj <Esc>
nnoremap Q <Nop>
nnoremap <silent> <leader>w :wa<cr>

" --- Plugins ---

source ~/.vim/plugins.vim

" --- Colorscheme ---

" true colors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
silent! colorscheme tokyonight
syntax on

" built-in commenting (gc/gcc) - replaces vim-commentary
packadd comment

" --- Editor Settings ---

set autoread
set belloff=all
set clipboard=unnamedplus
set completeopt=preview,menuone,noinsert
set complete-=i
highlight cursorline cterm=none
set colorcolumn=121
set hidden
set number
set omnifunc=syntaxcomplete#Complete
set relativenumber
set scrolloff=10
set signcolumn=yes
set shortmess+=I
set showmatch

" --- Backup ---

set noswapfile
set nobackup
set nowritebackup

" --- Completion ---

set wildmode=list:longest,full
set wildignore=*.git,bundle

" --- Cursor ---

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" --- Font Highlights ---

highlight htmlarg cterm=italic
highlight comment cterm=italic

" --- Search ---

set gdefault
set hlsearch
set ignorecase
hi Search cterm=underline
set smartcase

" --- Status Line ---

set laststatus=2
set noshowmode

" --- Listchars ---

set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸▸

" --- Tabs ---

set expandtab
set shiftwidth=2
set softtabstop=2

" --- Folding ---

set nofoldenable

" --- Project-specific ---

set exrc
set secure

" --- Netrw ---

let g:netrw_altfile = 1
let g:netrw_banner = 0
let g:netrw_fastbrowse = 0

" --- Autocmds ---

augroup numbering
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup end

augroup terminal
  autocmd!
  autocmd BufWinEnter *
        \ if &buftype == 'terminal' |
        \   setlocal nonumber norelativenumber |
        \ endif
augroup end
