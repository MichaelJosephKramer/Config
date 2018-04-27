" ******************************************************************************
" VIM-PLUG
" ******************************************************************************
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-airline-colornum'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" add sign column emoticons
let g:ale_sign_warning = '😱'
let g:ale_sign_error = '⛔'

" message format
let g:ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

" autofix
let g:ale_fix_on_save = 1

" ale fixers
let g:ale_fixers = {
      \  'elixir': [
      \   'mix_format',
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'javascript': [
      \   'eslint',
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'ruby': [
      \   'rubocop',
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \}

" ale colors for highlights
augroup ale_highlights
  autocmd!
  autocmd ColorScheme * highlight ALEError ctermbg=88
  autocmd ColorScheme * highlight ALEErrorSign ctermfg=196
  autocmd ColorScheme * highlight ALEWarning ctermbg=8
  autocmd ColorScheme * highlight ALEWarningSign ctermfg=226
augroup end

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

" map GFiles command
nnoremap <silent> <Leader>t :GFiles<CR>

" map Files command
nnoremap <silent> <Leader>f :Files<CR>

" map Lines command
nnoremap <silent> <Leader>l :Lines<CR>

" map Snippets command
nnoremap <silent> <Leader>s :Snippets<CR>

" map Tags command
nnoremap <silent> <Leader>c :Tags<CR>

" ******************************************************************************
" INDENTLINE
" ******************************************************************************

" changes the indent line character
let g:indentLine_char = '┊'

" exclude json and sh files
let g:indentLine_fileTypeExclude = ['json', 'sh']

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
nnoremap <silent> t<C-n> :noautocmd wa<cr> :TestNearest<CR>
nnoremap <silent> t<C-f> :noautocmd wa<cr> :TestFile<CR>
nnoremap <silent> t<C-a> :noautocmd wa<cr> :TestSuite<CR>
nnoremap <silent> t<C-l> :noautocmd wa<cr> :TestLast<CR>

" set the default strategy
let test#strategy = "vimterminal"

" ******************************************************************************
" YOUCOMPLETEME
" ******************************************************************************

" add language keywords
let g:ycm_seed_identifiers_with_syntax = 1

" add tag files integration
let g:ycm_collect_identifiers_from_tags_files = 1

" add preview
let g:ycm_add_preview_to_completeopt = 1
