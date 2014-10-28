" ******************************************************************************
" ADDITIONAL SYNTAX HIGHLIGHTING
" ******************************************************************************

augroup syntax
  autocmd!
  autocmd BufNewFile,BufRead *.json setfiletype javascript
  autocmd BufNewFile,BufRead *.hbs setfiletype html
  autocmd BufNewFile,BufRead {Gemfile,Guardfile,*.rabl} setfiletype ruby
augroup end

" correct terrible out-of-the-box html indentation
let g:html_indent_inctags = "html,body,head,tbody,script,li,p"

" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" the color sheme, dumbass
colorscheme vividchalk

" enable color syntax highlighting
syntax on

" ******************************************************************************
" BASICS
"
" Oh, behave...
" ******************************************************************************

" update the file if it's been changed externally
set autoread

" allow backspacing in insert mode
set backspace=indent,eol,start

" allow clipboard access
set clipboard=unnamed

" highlight current line
set cursorline

" current line highlight details
highlight cursorline cterm=bold

" highlight current column
set cursorcolumn

" higlight columns past 80
execute "set colorcolumn=" . join(range(81,335), ',')

" allow hidden buffers instead of closing
set hidden

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

" set the shell - this works for zsh
set shell=sh

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
"
" OSX iTerm2 Specific
" ******************************************************************************

" change the cursor shape in edit mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ******************************************************************************
" SEARCH
" ******************************************************************************

" highlight search matches
set hlsearch

" underline search matches
hi Search cterm=underline

" show matches as you type the search pattern
set incsearch

" ignore case when searching
set ignorecase

" search is case-insensitive if lowercase, case-sensitive otherwise
set smartcase

" ******************************************************************************
" STATUS LINE
" ******************************************************************************

" show the status line
set laststatus=2

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
" FOLDING
" ******************************************************************************

set nofoldenable

" ******************************************************************************
" PROJECT-SPECIFIC
" ******************************************************************************

" allow per-project configuration files
set exrc

" prevent bad things in project-specific files
set secure
