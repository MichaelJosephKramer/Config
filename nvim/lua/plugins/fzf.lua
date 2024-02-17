return {
  'junegunn/fzf.vim',
  dependencies = { "junegunn/fzf", },
  init = function()
    vim.env.FZF_DEFAULT_OPTS='--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 '..
      '--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 '..
      '--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff '..
      '--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a '..
      '--border '..
      '--layout=reverse'
    vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
    vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/' }
    vim.cmd [[
      inoremap <expr> <c-x><c-h> fzf#vim#complete(fzf#wrap({
          \ 'prefix': '^.*$',
          \ 'source': 'rg -n ^ --color always',
          \ 'options': '--ansi --delimiter : --nth 3..',
          \ 'reducer': { lines -> join(split(lines[-1], ':\zs')[2:], '') }
          \ }))
    ]]
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
