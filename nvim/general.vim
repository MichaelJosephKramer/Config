" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" the color scheme, dumbass
silent! colorscheme vividchalk

" change the background color of the autocomplete menu
highlight pmenu ctermbg=172 gui=bold

" change the select backgroud color of the autocomplete menu
highlight pmenusel ctermbg=92 gui=bold

" ******************************************************************************
" BASICS
"
" Oh, behave...
" ******************************************************************************

" enable cursor changes by mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" allow clipboard access
set clipboard=unnamed

" highlight current column
set cursorcolumn

" highlight current line
set cursorline

" current line highlight details
highlight cursorline cterm=none

" higlight columns past 80
execute "set colorcolumn=" . join(range(81,335), ',')

" allow hidden buffers instead of closing
set hidden

" live substiution
set inccommand=split

" update redraw settings
set nolazyredraw

" show the line number
set number

" show the relative line number
set relativenumber

" scroll buffer
set scrolloff=10

"Remove splash screen
set shortmess+=I

" shows selected lines
set showcmd

" jumps to matching brackets
set showmatch

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

" italicize comments
highlight comment cterm=italic

" italicize html arguments
highlight htmlarg cterm=italic

" ******************************************************************************
" SEARCH
" ******************************************************************************

" underline search matches
hi Search cterm=underline

" set line substiution to global by default
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
