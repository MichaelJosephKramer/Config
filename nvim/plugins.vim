" ******************************************************************************
" VIM-PLUG
" ******************************************************************************

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'jacoborus/tender.vim'
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast', 'TestSuite'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'maximbaz/lightline-ale'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'
call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" message format
let g:ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

" elixir-specific configuration
let g:ale_elixir_credo_strict = 1
let g:ale_elixir_elixir_ls_release = '/Users/michael/code/oss/elixir-ls/rel'
let g:ale_elixir_elixir_ls_config = {
\   'elixirLS': {
\     'dialyzerEnabled': v:false,
\   },
\}

" rust-specific configuration
let g:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }

" autofix
let g:ale_fix_on_save = 1

" ale linters
let g:ale_linters = {
      \  'elixir': ['credo', 'elixir-ls'],
      \  'python': ['pyls'],
      \  'ruby': ['rubocop', 'solargraph'],
      \  'rust': ['rls'],
      \}

" ale fixers
let g:ale_fixers = {
      \  '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'elixir': ['mix_format'],
      \  'javascript': ['eslint'],
      \  'javascript.jsx': ['eslint'],
      \  'python': ['yapf'],
      \  'ruby': ['rubocop' ],
      \  'rust': ['rustfmt'],
      \}

" ale linting configuration
let g:ale_lint_on_enter = 1

" add sign column emoticons
let g:ale_sign_warning = "\u279c"
let g:ale_sign_error = "\u2718"

" ale colors for highlights
augroup ale_highlights
  autocmd!
  autocmd ColorScheme * highlight ALEError ctermbg=88 guibg=#870000
  autocmd ColorScheme * highlight ALEErrorSign ctermfg=196 guifg=#ff0000
  autocmd ColorScheme * highlight ALEWarning ctermbg=8 guibg=#808080
  autocmd ColorScheme * highlight ALEWarningSign ctermfg=226 guifg=#ffff00
augroup end

" integrate ale completion with omnifunc
set omnifunc=ale#completion#OmniFunc

" ******************************************************************************
" FZF.VIM
" ******************************************************************************

" set default FZF options for VIM
let $FZF_DEFAULT_OPTS='--color=border:#b3deef --border --layout=reverse --margin=1,4'

" configure the popup window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" configure the preview window
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

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
      \ 'reducer': { lines -> join(split(lines[-1], ':\zs')[2:], '') }
      \ }))

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
      \   'left': [['mode', 'paste'], ['branch'], ['relativepath'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], ['treesitter']],
      \   'right': [['lineinfo'], ['percent'], ['modified', 'fileformat', 'fileencoding', 'filetype']],
      \ },
      \ 'colorscheme': 'tender',
      \ 'component_function': {
      \   'branch': 'fugitive#head',
      \   'completion': 'Completion',
      \   'treesitter': 'TreesitterLightline'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ }

function! TreesitterLightline()
  let l:status = nvim_treesitter#statusline(90)
  if l:status == 'null'
    return ''
  else
    return l:status
  endif
endfunction

" ******************************************************************************
" LIGHTLINE-ALE
" ******************************************************************************

" set the indicators
let g:lightline#ale#indicator_ok = "\u2714 "
let g:lightline#ale#indicator_warnings = "\u279c "
let g:lightline#ale#indicator_errors = "\u2718 "
let g:lightline#ale#indicator_checking = "\u29D7 "

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
" TENDER
" ******************************************************************************

" the color scheme, dumbass
silent! colorscheme tender

" ******************************************************************************
" TREESITTER
" ******************************************************************************

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "python",
    "ruby",
    "rust"
   },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = { enable = true },
    smart_rename = { enable = true },
  },
}
EOF

" ******************************************************************************
" ULTISNIPS
" ******************************************************************************

" trigger mappings
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" ******************************************************************************
" VIM-FUGITIVE
" ******************************************************************************

" Adds git grep results to the Quickfix window
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
let test#strategy = "neovim"

" switch to the neovim testing terminal
tnoremap <C-o> <C-\><C-n>
