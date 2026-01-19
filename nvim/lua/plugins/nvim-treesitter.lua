return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    ensure_installed = {
      'c', 'cpp', 'css', 'html', 'javascript', 'jsdoc',
      'lua', 'python', 'ruby', 'rust', 'vimdoc',
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
