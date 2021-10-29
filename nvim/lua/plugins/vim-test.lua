--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------

local g = vim.g
local map = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------

g["test#strategy"] = "neovim" -- default strategy

--------------------------------------------------------------------------------
-- MAPPINGS
--------------------------------------------------------------------------------

map('n', 't<C-n>', ':noautocmd wa<cr> :TestNearest<CR>', { noremap = true, silent = true })
map('n', 't<C-f>', ':noautocmd wa<cr> :TestFile<CR>',    { noremap = true, silent = true })
map('n', 't<C-a>', ':noautocmd wa<cr> :TestSuite<CR>',   { noremap = true, silent = true })
map('n', 't<C-l>', ':noautocmd wa<cr> :TestLast<CR>',    { noremap = true, silent = true })
map('t', '<C-o>',  '<C-\\><C-n>', { noremap = true })
