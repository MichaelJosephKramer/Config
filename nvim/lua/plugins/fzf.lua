return {
  'junegunn/fzf.vim',
  dependencies = { 'junegunn/fzf' },
  init = function()
    vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
    vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/' }
    vim.keymap.set('i', '<c-x><c-h>', function()
      return vim.fn['fzf#vim#complete'](vim.fn['fzf#wrap']({
        prefix = '^.*$',
        source = 'rg -n ^ --color always',
        options = '--ansi --delimiter : --nth 3..',
        reducer = function(lines)
          local parts = vim.fn.split(lines[#lines], [[\:\zs]])
          return table.concat(vim.list_slice(parts, 3), '')
        end,
      }))
    end, { expr = true })
  end,
  keys = {
    { '<leader>b', '<cmd>Buffers<cr>',  desc = 'FZF buffers' },
    { '<leader>t', '<cmd>GFiles<cr>',   desc = 'FZF git files' },
    { '<leader>f', '<cmd>Files<cr>',    desc = 'FZF files' },
    { '<leader>l', '<cmd>Lines<cr>',    desc = 'FZF lines' },
    { '<leader>m', '<cmd>Marks<cr>',    desc = 'FZF marks' },
    { '<leader>r', '<cmd>Rg<cr>',       desc = 'FZF ripgrep' },
  },
}
