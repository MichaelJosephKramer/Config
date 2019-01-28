" ******************************************************************************
" VIM-PLUG
" ******************************************************************************

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast', 'TestSuite'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" add sign column emoticons
let g:ale_sign_warning = "➜"
let g:ale_sign_error = "✘"

" message format
let g:ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

" autofix
let g:ale_fix_on_save = 1

" ale fixers
let g:ale_fixers = {
      \  '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'elixir': [
      \   'mix_format',
      \  ],
      \  'javascript': [
      \   'eslint',
      \  ],
      \  'ruby': [
      \   'rubocop',
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
" FZF.VIM
" ******************************************************************************

" map Buffers command
nnoremap <silent> <leader>b :Buffers<CR>

" map GFiles command
nnoremap <silent> <leader>t :GFiles<CR>

" map Files command
nnoremap <silent> <leader>f :Files<CR>

" map Lines command
nnoremap <silent> <leader>l :Lines<CR>

" map Marks command
nnoremap <silent> <leader>m :Marks<CR>

" map Snippets command
nnoremap <silent> <leader>s :Snippets<CR>

" map Rg command
nnoremap <silent> <leader>r :Rg<CR>

" map Tags command
nnoremap <silent> <leader>c :Tags<CR>

" use ripgrep for full-line completion
inoremap <expr> <c-x><c-h> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
      \ }))

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" ******************************************************************************
" INDENTLINE
" ******************************************************************************

" changes the indent line character
let g:indentLine_char = '┊'

" exclude json and sh files
let g:indentLine_fileTypeExclude = ['json', 'sh']

" ******************************************************************************
" LIGHTLINE
" ******************************************************************************

let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  :echom 'here'
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ➜ ', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

augroup _lightline
  autocmd!
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
augroup END

" ******************************************************************************
" MUCOMPLETE
" ******************************************************************************

" use the global completeopt
let g:mucomplete#always_use_completeopt = 1

" cycle with tab instead of selection
let g:mucomplete#cycle_with_trigger = 1

" extend current completion
imap <expr> <down> mucomplete#extend_fwd("\<down>")

" add completion chain
let g:mucomplete#chains = {
      \ 'default' : [
      \    'ulti',
      \    'list',
      \    'tags',
      \    'line',
      \    'incl',
      \    'file',
      \    'path',
      \   ],
      \ }

let g:mucomplete#wordlist = {
      \   'javascript.jsx': [
      \     'console.log',
      \   ],
      \   'ruby': [
      \     'binding.pry',
      \   ],
      \ }

inoremap <silent> <expr> <cr> mucomplete#ultisnips#expand_snippet("\<cr>")

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
let g:UltiSnipsExpandTrigger       = "<f5>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"

" ******************************************************************************
" VIM-AIRLINE
" ******************************************************************************

" add fancy glyphs -- requires a powerline font
let g:airline_powerline_fonts = 0

" hide empty trailing sections
let g:airline_skip_empty_sections = 1

" set the airline theme
let g:airline_theme = 'light'

" ******************************************************************************
" VIM-FUGITIVE
" ******************************************************************************

" Adds git grep results to the Quickfix window
augroup fugitive_quickfix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

" Fires git grep on the word under cursor
nnoremap <silent> <leader>g :Ggrep <cword><CR>

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
