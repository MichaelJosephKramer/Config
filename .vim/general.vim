" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" colorscheme
silent! colorscheme vividchalk

" enable color syntax highlighting
syntax on

" change the background color of the autocomplete menu
highlight Pmenu guibg=#d78700 ctermbg=172

" change the select background color of the autocomplete menu
highlight PmenuSel guibg=#8700d7 ctermbg=92

" change the sign column background color
highlight SignColumn guibg=black ctermbg=black

" turn on true colors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" set the max number of columns for syntax highlighting
set synmaxcol=256

" ******************************************************************************
" BASICS
"
" Oh, behave...
" ******************************************************************************

" update the file if it's been changed externally
set autoread

" allow backspacing in insert mode
set backspace=indent,eol,start

" turn off the error bells
set belloff=all

" allow clipboard access
set clipboard=unnamedplus

" add auto select
set completeopt=preview,menuone,noinsert

" remove file paths from completion, for performance
set complete-=i

" current line highlight details
highlight cursorline cterm=none

" highlight columns past 120
set colorcolumn=121

" allow hidden buffers instead of closing
set hidden

" show the line number
set number

" set omnifunc
set omnifunc=syntaxcomplete#Complete

" use the legacy regex engine - improves ruby syntax highlighting performance
set regexpengine=1

" show the relative line number
set relativenumber

" scroll buffer
set scrolloff=10

" set the sign column to be visible
set signcolumn=yes

" set the shell - this works for bash
set shell=/bin/bash

"Remove splash screen
set shortmess+=I

" shows selected lines
set showcmd

" jumps to matching brackets
set showmatch

" ******************************************************************************
" BACKUP FILES
"
" Don't let VIM do this...
" ******************************************************************************

" no swapfiles
set noswapfile

" no backup files
set nobackup

" no backup files for editing
set nowritebackup

" ******************************************************************************
" COMPLETION
" ******************************************************************************

" allows command line completion
set wildmenu

" command line expansion options
set wildmode=list:longest,full

" ignore from completion
set wildignore=*.git,bundle

" ******************************************************************************
" CURSOR
" ******************************************************************************

" change the cursor shape in edit mode (bar in insert, block in normal)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" ******************************************************************************
" FONT
" ******************************************************************************

" italic html arguments
highlight htmlarg cterm=italic

" italic comments
highlight comment cterm=italic

" ******************************************************************************
" SEARCH
" ******************************************************************************

" set line substitution to global by default
set gdefault

" highlight search matches
set hlsearch

" ignore case when searching
set ignorecase

" underline search matches
hi Search cterm=underline

" search is case-insensitive if lowercase, case-sensitive otherwise
set smartcase

" ******************************************************************************
" STATUS LINE
" ******************************************************************************

" show the status line
set laststatus=2

" set noshowmode, since we see the information from the statusline
set noshowmode

" ******************************************************************************
" LISTCHARS
" ******************************************************************************

" set list characters
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸▸

" ******************************************************************************
" NUMBERING
" ******************************************************************************

augroup numbering
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup end

" ******************************************************************************
" TABS
" ******************************************************************************

" use spaces instead of tab
set expandtab

" set width for indentation commands
set shiftwidth=2

" set number of spaces for tab
set softtabstop=2

" ******************************************************************************
" FOLDING
" ******************************************************************************

" turn off folding
set nofoldenable

" ******************************************************************************
" PROJECT-SPECIFIC
" ******************************************************************************

" allow per-project configuration files
set exrc

" prevent bad things in project-specific files
set secure

" ******************************************************************************
" NETRW CONFIGURATION
" ******************************************************************************

" don't set netrw as the altfile
let g:netrw_altfile = 1

" hide the banner because it's useless
let g:netrw_banner = 0

" disable netrw caching
let g:netrw_fastbrowse = 0

" ******************************************************************************
" TERMINAL CONFIGURATION
" ******************************************************************************

augroup terminal
  autocmd!
  autocmd BufWinEnter *
        \ if &buftype == 'terminal' |
        \   setlocal nonumber norelativenumber |
        \ endif
augroup end
