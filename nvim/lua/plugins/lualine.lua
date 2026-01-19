return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'folke/tokyonight.nvim' },
  config = function()
    require('lualine').setup {
      options = { theme = 'tokyonight' },
      sections = {
        lualine_c = {
          'filename',
          { function() return vim.fn['nvim_treesitter#statusline'](90) or '' end },
        },
      },
      extensions = { 'lazy' },
    }
  end,
}
