return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    ensure_installed = {
      'bash', 'c', 'cpp', 'css', 'elixir', 'heex',
      'html', 'javascript', 'jsdoc', 'json', 'lua',
      'markdown', 'python', 'ruby', 'rust', 'toml',
      'tsx', 'typescript', 'vimdoc', 'yaml',
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
