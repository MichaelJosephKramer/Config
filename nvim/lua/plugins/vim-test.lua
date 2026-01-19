return {
  'janko-m/vim-test',
  keys = {
    { 't<C-n>', '<cmd>noautocmd wa<cr><cmd>TestNearest<cr>', desc = 'Test nearest' },
    { 't<C-f>', '<cmd>noautocmd wa<cr><cmd>TestFile<cr>',    desc = 'Test file' },
    { 't<C-s>', '<cmd>noautocmd wa<cr><cmd>TestSuite<cr>',   desc = 'Test suite' },
    { 't<C-l>', '<cmd>noautocmd wa<cr><cmd>TestLast<cr>',    desc = 'Test last' },
    { 't<C-g>', '<cmd>noautocmd wa<cr><cmd>TestVisit<cr>',   desc = 'Test visit' },
    { '<C-o>',  '<C-\\><C-n>', mode = 't', desc = 'Exit terminal mode' },
  },
}

