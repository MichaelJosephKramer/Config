" ******************************************************************************
" VUNDLE!
" ******************************************************************************

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'csexton/trailertrash.vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mrtazz/simplenote.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/summerfruit256.vim'

call vundle#end()

" ******************************************************************************
" CTRLP.VIM
" ******************************************************************************

" add plugins
let g:ctrlp_extensions = ['tag']

" show hidden files
let g:ctrlp_show_hidden = 1

" visual config
let g:ctrlp_match_window = "bottom,order:ttp,min:1,max:20,results:20"

" open buffer mode
nnoremap <silent> <c-b> :CtrlPBuffer<CR>

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
" VIM-RSPEC
" ******************************************************************************
nnoremap <leader>t :call RunCurrentSpecFile()<CR>
nnoremap <leader>s :call RunNearestSpec()<CR>
nnoremap <leader>l :call RunLastSpec()<CR>
nnoremap <leader>a :call RunAllSpecs()<CR>

" ******************************************************************************
" VIM-GITGUTTER
" ******************************************************************************

" start with git gutter off
let g:gitgutter_enabled = 0

" toggle the git gutter
nnoremap <silent> <leader>g :GitGutterToggle<CR>

" toggle the git gutter highlights
nnoremap <silent> <leader>h :GitGutterLineHighlightsToggle<CR>
