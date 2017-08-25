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
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-airline-colornum'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'SirVer/ultisnips'
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
Plug 'w0rp/ale'

" mxw/vim-jsx depends on pangloss/vim-javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript'}

" deoplete sources
Plug 'fishbullet/deoplete-ruby'
Plug 'pbogut/deoplete-elm'

call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" reset sign column background colors
highlight link ALEErrorSign SignColumn
highlight link ALEWarningSign SignColumn

" add sign column emoticons
let g:ale_sign_error = '😱'
let g:ale_sign_warning = '🚧'

" message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" autofix
let g:ale_fix_on_save = 1

" ale fixers
let g:ale_fixers = {
      \  'javascript': [
      \   'eslint',
      \   'remove_trailing_lines',
      \  ],
      \  'ruby': [
      \   'rubocop',
      \   'remove_trailing_lines',
      \  ],
      \}

" turn off highlights
let g:ale_set_highlights = 0

" ******************************************************************************
" DEOPLETE
" ******************************************************************************

" rank completion higher than other sources
call deoplete#custom#set('ultisnips', 'rank', 9999)

" use deoplete
let g:deoplete#enable_at_startup = 1

" set max list size
let g:deoplete#max_list = 10

" set sources
let g:deoplete#sources = get(g:, 'deoplete#sources', {})
let g:deoplete#sources._ = [
      \'around',
      \'buffer',
      \'file',
      \'member',
      \'tag',
      \'ultisnips'
      \]

" ruby configuration
let g:deoplete#sources.ruby = g:deoplete#sources._ + ['ruby']

" elm configuration
let g:deoplete#sources.elm = g:deoplete#sources._ + ['elm']
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.elm = '\.'

let g:deoplete#sources.elixir = g:deoplete#sources._ + ['alchemist']

" increase default tag cache
let deoplete#tag#cache_limit_size = 5000000

" add incremental refresh
let g:deoplete#enable_refresh_always = 1

" ******************************************************************************
" ELM-VIM
" ******************************************************************************

" formats elm files on save
let g:elm_format_autosave = 1

" ******************************************************************************
" FZF.VIM
" ******************************************************************************

" map Buffers command
nnoremap <silent> <Leader>b :Buffers<CR>

" map Files command
nnoremap <silent> <Leader>t :GFiles<CR>

" map Snippets command
nnoremap <silent> <Leader>s :Snippets<CR>

" map Tags command
nnoremap <silent> <Leader>c :Tags<CR>

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
" VIM-AIRLINE
" ******************************************************************************

" add fancy glyphs -- requires a powerline font
let g:airline_powerline_fonts = 1

" set the airline theme
let g:airline_theme = 'light'

" ******************************************************************************
" VIM-GITGUTTER
" ******************************************************************************

" start with gitgutter off
let g:gitgutter_enabled = 0

" toggle the git gutter
nnoremap <silent> <leader>g :GitGutterToggle<CR>

" toggle the git gutter highlights
nnoremap <silent> <leader>h :GitGutterLineHighlightsToggle<CR>

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
" VIM-JSX
" ******************************************************************************

" don't requre the .jsx extension
let g:jsx_ext_required = 0

" ******************************************************************************
" VIM-TEST
" ******************************************************************************

" mappings
nnoremap <leader>n :noautocmd wa<cr> :TestNearest<CR>
nnoremap <leader>f :noautocmd wa<cr> :TestFile<CR>
nnoremap <leader>a :noautocmd wa<cr> :TestSuite<CR>
nnoremap <leader>l :noautocmd wa<cr> :TestLast<CR>

" preseve the screen
let g:test#preserve_screen = 1
