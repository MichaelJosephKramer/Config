" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" set the max number of columns for syntax highlighting
set synmaxcol=256

" true colors
set termguicolors

" embedded lua highlighting, for lua, python, and ruby
let g:vimsyn_embed = 'lPr'

" ******************************************************************************
" BASICS
"
" Oh, behave...
" ******************************************************************************

" allow clipboard access
set clipboard=unnamed

" add auto select
set completeopt=noinsert,menuone

" current line highlight details
highlight cursorline cterm=none

" highlight columns past 80
let &colorcolumn="".join(range(121,999),",")

" allow hidden buffers instead of closing
set hidden

" live substitution
set inccommand=split

" show the line number
set number

" show the relative line number
set relativenumber

" scroll buffer
set scrolloff=10

"Remove splash screen
set shortmess+=I
set shortmess+=c

" shows selected lines
set showcmd

" jumps to matching brackets
set showmatch

" the updatetime default is too slow
set updatetime=300

" vim is terrible without this - no beeps
set visualbell

" ******************************************************************************
" BACKUP FILES
"
" Don't let VIM do this...
" ******************************************************************************

" no backup files
set nobackup

" no swapfiles
set noswapfile

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
" FONT
" ******************************************************************************

" bold comments
highlight comment cterm=italic gui=italic

" bold html arguments
highlight htmlarg cterm=italic gui=italic

" ******************************************************************************
" SEARCH
" ******************************************************************************

" underline search matches
hi Search cterm=underline

" set line substitution to global by default
set gdefault

" ignore case when searching
set ignorecase

" search is case-insensitive if lowercase, case-sensitive otherwise
set smartcase

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

" FileType exceptions
autocmd Filetype elm setlocal tabstop=4 shiftwidth=4

" ******************************************************************************
" FOLDING
" ******************************************************************************

" disable folding
set nofoldenable

" ******************************************************************************
" PROJECT-SPECIFIC
" ******************************************************************************

" allow per-project configuration files
set exrc

" prevent bad things in project-specific files
set secure

" ******************************************************************************
" SIGN COLUMN DISPLAY
" ******************************************************************************

" always display the sign column
set signcolumn=yes

" ******************************************************************************
" NETRW CONFIGURATION
" ******************************************************************************

" don't set netrw as the altfile
let g:netrw_altfile = 1

" hide the banner because it's useless
let g:netrw_banner = 0

" set list style
let g:netrw_liststyle = 3

" ******************************************************************************
" NEOVIM TERMINAL CONFIGURATION
" ******************************************************************************

augroup neovim_terminal_open
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
