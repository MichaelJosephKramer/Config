" ******************************************************************************
" VUNDLE!
" ******************************************************************************

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'csexton/trailertrash.vim'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'janko-m/vim-test'
Plugin 'kchmck/vim-coffee-script'
Plugin 'majutsushi/tagbar'
Plugin 'mrtazz/simplenote.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips.git'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'wincent/command-t'

call vundle#end()

" ******************************************************************************
" COMMAND-T
" ******************************************************************************

" basic mapping to use the window
let g:CommandTCancelMap     = '<ESC>'
let g:CommandTSelectNextMap = '<ESC>OB'
let g:CommandTSelectPrevMap = '<ESC>OA'

" show hidden files
let g:CommandTScanDotDirectories = 1

" set the max height
let g:CommandTMaxHeight = 20

" set defaults to smaller numbers for performance reasons
let g:CommandTMaxFiles = 10000
let g:CommandTMaxDepth = 10

" flush the contents of the bugger
nnoremap <silent> <leader>f :CommandTFlush<CR>

" ******************************************************************************
" NERDTREE
" ******************************************************************************

" toggle NERDTree on and off
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" close NERDTree when a file is selected
let NERDTreeQuitOnOpen = 1

" ******************************************************************************
" RAINBOW_PARENTHESES.VIM
" ******************************************************************************

" initializes rainbow_parenthesis
augroup startRainbow
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd BufEnter * RainbowParenthesesLoadRound
  autocmd BufEnter * RainbowParenthesesLoadSquare
  autocmd BufEnter * RainbowParenthesesLoadBraces
augroup end

" set number of colors
let g:rbpt_max = 14

" custom colors
let g:rbpt_colorpairs = [
    \ ['magenta'  , ''] ,
    \ ['brown'    , ''] ,
    \ ['darkgreen', ''] ,
    \ ['darkcyan' , ''] ,
    \ ['darkgray' , ''] ,
    \ ['lightblue', ''] ,
    \ ['darkred'  , ''] ,
    \ ]

" toggle rainbow_parenthesis
nnoremap <silent> <leader>r :call RainbowParenthesesToggleAllAndLoad()<cr>

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
" TRAILERTRASH
" ******************************************************************************

" Maps to more succient command
:command! Trim TrailerTrim

" ******************************************************************************
" ULTISNIPS
" ******************************************************************************

" trigger mappings
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets        = "<c-l>"

" ******************************************************************************
" VIM-AIRLINE
" ******************************************************************************

" add fancy glyphs -- requires a powerline font
let g:airline_powerline_fonts = 1

" set the airline theme
let g:airline_theme = 'light'

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

" ******************************************************************************
" VIM-TEST
" ******************************************************************************

nnoremap <leader>n :wa<cr> :TestNearest<CR>
nnoremap <leader>f :wa<cr> :TestFile<CR>
nnoremap <leader>a :wa<cr> :TestSuite<CR>
nnoremap <leader>l :wa<cr> :TestLast<CR>
