" ******************************************************************************
" VUNDLE!
" ******************************************************************************

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'csexton/trailertrash.vim'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mrtazz/simplenote.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-scripts/summerfruit256.vim'

" ******************************************************************************
" CTRLP.VIM
" ******************************************************************************

" show hidden files
let g:ctrlp_show_hidden = 1

" visual config
let g:ctrlp_match_window = "bottom,order:ttp,min:1,max:20,results:20"

" ******************************************************************************
" NERDTREE
" ******************************************************************************

" toggle NERDTree on and off
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" close NERDTree when a file is selected
let NERDTreeQuitOnOpen = 1

" directories NERDTree should ignore
let NERDTreeIgnore = ['node_modules$[[dir]]']

" ******************************************************************************
" SIMPLENOTE.VIM
" ******************************************************************************

" source the simplenote config
" not managed by git because of the password
if filereadable(expand("\~/.simplenoterc"))
  source \~/.simplenoterc
endif

" ******************************************************************************
" SYNTASTIC
" ******************************************************************************

" set to check files when opened
let g:syntastic_check_on_open = 1

" set syntastic error symbol
let g:syntastic_error_symbol = '⛔'

" set syntastic warning symbol
let g:syntastic_warning_symbol = '🚧'

" set syntastic to always populate the loclist
let g:syntastic_always_populate_loc_list = 1

" open and close the loclist automatically
let g:syntastic_auto_loc_list = 1

" set active/passive filetypes
let g:syntastic_mode_map= {
  \ 'mode': 'active',
  \ 'active_filetypes'  : [],
  \ 'passive_filetypes' : ['html']
  \ }

" toggle the mode
nnoremap <silent> <leader>s :SyntasticToggleMode<CR>

" ******************************************************************************
" TAGBAR
" ******************************************************************************

" toggle tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" hide line numbers
let g:tagbar_show_linenumbers = 0

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
