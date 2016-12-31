" ******************************************************************************
" LEADER!
"
" must be mapped before plugins are loaded...
" ******************************************************************************

let g:mapleader = ","

" ******************************************************************************
" IMPORTS
" ******************************************************************************

for config in ['plugins.vim', 'functions.vim', 'general.vim', 'mappings.vim']
  execute 'source ' . $XDG_CONFIG_HOME . '/nvim/' . config
endfor
