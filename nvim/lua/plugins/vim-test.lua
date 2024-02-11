return {
  'janko-m/vim-test',
  keys = {
    { 't<C-n>', ':noautocmd wa<cr> :TestNearest<CR>', { noremap = true, silent = true }},
    { 't<C-f>', ':noautocmd wa<cr> :TestFile<CR>',    { noremap = true, silent = true }},
    { 't<C-s>', ':noautocmd wa<cr> :TestSuite<CR>',   { noremap = true, silent = true }},
    { 't<C-l>', ':noautocmd wa<cr> :TestLast<CR>',    { noremap = true, silent = true }},
    { 't<C-g>', ':noautocmd wa<cr> :TestVisit<CR>',   { noremap = true, silent = true }},
    { '<C-o>',  '<C-\\><C-n>', 't', { noremap = true }}
  }
}

