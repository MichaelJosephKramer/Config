" --- indentLine ---

" changes the indent line character
let g:indentLine_char = '┊'

" exclude json and sh files
let g:indentLine_fileTypeExclude = ['json', 'sh']

" --- Rainbow Parentheses ---

augroup rainbow_activate
  autocmd!
  autocmd VimEnter * silent! RainbowParentheses
augroup end

" add the [] and {}
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" --- Tagbar ---

" toggle tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" hide line numbers
let g:tagbar_show_linenumbers = 0

" --- UltiSnips ---

" trigger mappings
let g:UltiSnipsExpandTrigger       = "<f5>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
