return {
  'junegunn/fzf.vim',
  dependencies = { "junegunn/fzf", },
  init = function()
    vim.env.FZF_DEFAULT_OPTS='--color=border:#b3deef --border --layout=reverse --margin=1,4'
    vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
    vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/' }
  end,
  keys = {
    {  '<leader>b', ':Buffers<cr>',  {  noremap = true, silent = true }},
    {  '<leader>t', ':GFiles<cr>',   {  noremap = true, silent = true }},
    {  '<leader>f', ':Files<cr>',    {  noremap = true, silent = true }},
    {  '<leader>l', ':Lines<cr>',    {  noremap = true, silent = true }},
    {  '<leader>m', ':Marks<cr>',    {  noremap = true, silent = true }},
    {  '<leader>s', ':Snippets<cr>', {  noremap = true, silent = true }},
    {  '<leader>r', ':Rg<cr>',       {  noremap = true, silent = true }},
    {  '<leader>c', ':Tags<cr>',     {  noremap = true, silent = true }},
  },
}
