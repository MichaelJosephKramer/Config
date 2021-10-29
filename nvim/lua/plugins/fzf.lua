--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------

local cmd = vim.cmd
local env = vim.env
local g = vim.g
local map = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------

env.FZF_DEFAULT_OPTS='--color=border:#b3deef --border --layout=reverse --margin=1,4'

g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
g.fzf_preview_window = { 'right:60%', 'ctrl-/' }

--  use ripgrep for full-line completion
cmd [[
  inoremap <expr> <c-x><c-h> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[-1], ':\zs')[2:], '') }
      \ }))
]]

--------------------------------------------------------------------------------
-- MAPPINGS
--------------------------------------------------------------------------------

map('n', '<leader>b', ':Buffers<cr>',  { noremap = true, silent = true })
map('n', '<leader>t', ':GFiles<cr>',   { noremap = true, silent = true })
map('n', '<leader>f', ':Files<cr>',    { noremap = true, silent = true })
map('n', '<leader>l', ':Lines<cr>',    { noremap = true, silent = true })
map('n', '<leader>m', ':Marks<cr>',    { noremap = true, silent = true })
map('n', '<leader>s', ':Snippets<cr>', { noremap = true, silent = true })
map('n', '<leader>r', ':Rg<cr>',       { noremap = true, silent = true })
map('n', '<leader>c', ':Tags<cr>',     { noremap = true, silent = true })
