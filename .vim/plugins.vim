" --- vim-plug bootstrap ---

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" --- Plugins ---

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'vim-test/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast', 'TestSuite'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'maximbaz/lightline-ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ghifarit53/tokyonight-vim'
Plug 'dense-analysis/ale'
Plug 'preservim/vim-indent-guides'
call plug#end()

" pre-load settings
let g:mucomplete#enable_auto_at_startup = 0

" --- Source plugin configs ---

for s:f in glob('~/.vim/config/*.vim', 0, 1)
  execute 'source' s:f
endfor
