" --- muComplete ---

" cycle with tab instead of selection
let g:mucomplete#cycle_with_trigger = 1

" extend current completion
imap <expr> <down> mucomplete#extend_fwd("\<down>")

" add completion chain
let g:mucomplete#chains = {
      \ 'default' : [
      \    'omni',
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
