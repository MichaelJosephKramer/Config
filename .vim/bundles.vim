" ******************************************************************************
" VUNDLE!
" ******************************************************************************

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'csexton/trailertrash.vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-vividchalk'
Bundle 'wincent/Command-T'

" ******************************************************************************
" COMMAND-T
" ******************************************************************************

" basic mapping to use the window
let g:CommandTCancelMap = '<ESC>'
let g:CommandTSelectNextMap = '<ESC>OB'
let g:CommandTSelectPrevMap = '<ESC>OA'

" show hidden files
let g:CommandTScanDotDirectories = 1



" ******************************************************************************
" NERDTREE
" ******************************************************************************

" toggle NERDTree on and off
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" close NERDTree when a file is selected
let NERDTreeQuitOnOpen = 1

" ******************************************************************************
" VIM-AIRLINE
" ******************************************************************************

" add fancy glyphs -- requires a powerline font
let g:airline_powerline_fonts=1

" set the airline theme
let g:airline_theme='light'

" ******************************************************************************
" VIM-COFFEE-SCRIPT
" ******************************************************************************

" compile CoffeeScript in a new buffer
vnoremap <silent> <localleader>c :CoffeeCompile<CR>

" ******************************************************************************
" VIM-GITGUTTER
" ******************************************************************************

" start with git gutter off
let g:gitgutter_enabled = 0

" toggle the git gutter
nnoremap <silent> <leader>g :GitGutterToggle<CR>

" toggle the git gutter highlights
nnoremap <silent> <leader>h :GitGutterLineHighlightsToggle<CR>
