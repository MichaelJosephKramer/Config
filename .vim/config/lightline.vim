" --- Lightline ---

let g:lightline = {
\ 'colorscheme': 'tokyonight',
\ 'active': {
\   'left': [['mode', 'paste'], ['branch'], ['relativepath'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
\   'right': [['lineinfo'], ['percent'], ['modified', 'fileformat', 'fileencoding', 'filetype'] ],
\ },
\ 'component_function': {
\   'branch': 'FugitiveHead'
\ },
\ 'component_expand': {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'left',
\ },
\ }

" --- Lightline-ALE ---

" set the indicators
let g:lightline#ale#indicator_ok = "\u2714 "
let g:lightline#ale#indicator_warnings = "\u279c "
let g:lightline#ale#indicator_errors = "\u2718 "
let g:lightline#ale#indicator_checking = "\u29D7 "
