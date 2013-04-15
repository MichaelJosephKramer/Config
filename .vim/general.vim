" ******************************************************************************  
" ADDITIONAL SYNTAX HIGHLIGHTING
" ****************************************************************************** 

augroup syntax 
  autocmd!
  autocmd BufNewFile,BufRead *.json setfiletype javascript
  autocmd BufNewFile,BufRead {Gemfile,Guardfile,*.rabl} setfiletype ruby
augroup end


" ****************************************************************************** 
" COLORSCHEME
"
" Oh, behave...
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

" allow hidden buffers instead of closing
set hidden

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
set wildignore=*.o,*.obj,*~

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

" the deets...
set statusline=\ %{fugitive#statusline()}\ File:\ %t\ %y\ %r 
set statusline+=%=Buffer:\ %n\ --\ Location:\ %l/%L:%c\ 

" change color of the status line on mode change
au InsertEnter * highlight statusline ctermbg=226 ctermfg=16
au InsertLeave * highlight statusline ctermbg=255 ctermfg=0

" ****************************************************************************** 
" TABS AND SPACES
" ******************************************************************************

" use spaces instead of tabs
set expandtab

" columns per tab
set tabstop=2

" number of spaces per indent (<< or >>)
set shiftwidth=2

" columns per tab in insert mode
set softtabstop=2