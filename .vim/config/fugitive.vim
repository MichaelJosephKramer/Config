" --- Fugitive ---

" Adds git grep results to the Quickfix window
augroup fugitive_quickfix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

" Fires git grep on the word under cursor
nnoremap <silent> <leader>g :Ggrep <cword><CR>
