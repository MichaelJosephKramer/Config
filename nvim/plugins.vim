" ******************************************************************************
" VIM-PLUG
" ******************************************************************************
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'csexton/trailertrash.vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'ntpeters/vim-airline-colornum'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'w0rp/ale'
call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" add sign column emoticons
let g:ale_sign_error = '😱'
let g:ale_sign_warning = '🚧'

" message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" always show the sign column
let g:ale_sign_column_always = 1

" reset sign column background colors
highlight link ALEError SignColumn
highlight link ALEWarning SignColumn
highlight link ALEErrorSign SignColumn
highlight link ALEWarningSign SignColumn

" ******************************************************************************
" DEOPLETE
" ******************************************************************************

" use deoplete
let g:deoplete#enable_at_startup = 1

" add auto select
set completeopt+=noinsert

" add tab select
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ******************************************************************************
" FZF.VIM
" ******************************************************************************

" show hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" map Buffers command
nnoremap <silent> <Leader>b :Buffers<CR>

" map Files command
nnoremap <silent> <Leader>t :Files<CR>

" ******************************************************************************
" RAINBOW_PARENTHESES
" ******************************************************************************

" activate immediately
autocmd VimEnter * silent! RainbowParentheses

" add the [] and {}
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

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
let g:UltiSnipsExpandTrigger       = "<c-j>"
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

" toggle the git gutter
nnoremap <silent> <leader>g :GitGutterToggle<CR>

" toggle the git gutter highlights
nnoremap <silent> <leader>h :GitGutterLineHighlightsToggle<CR>

" always show the sign column
let g:gitgutter_sign_column_always = 1

" gitgutter symbols
let g:gitgutter_sign_added = '🔹'
let g:gitgutter_sign_modified = '🔸'
let g:gitgutter_sign_removed = '🔺'
let g:gitgutter_sign_modified_removed = '💥'

" ******************************************************************************
" VIM-FUGITIVE
" ******************************************************************************

augroup fugitive_quickfix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

" ******************************************************************************
" VIM-TEST
" ******************************************************************************

" mappings
nnoremap <leader>n :noautocmd wa<cr> :TestNearest<CR> | redraw!
nnoremap <leader>f :noautocmd wa<cr> :TestFile<CR>    | redraw!
nnoremap <leader>a :noautocmd wa<cr> :TestSuite<CR>   | redraw!
nnoremap <leader>l :noautocmd wa<cr> :TestLast<CR>    | redraw!

" strategy
let test#strategy = 'neovim'
