return {
  'lewis6723/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
