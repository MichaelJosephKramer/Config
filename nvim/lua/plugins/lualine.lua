return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options    = { theme     = 'tokyonight' },
      sections   = { lualine_c = { 'filename', 'keymap', 'nvim_treesitter#statusline' }},
      extensions = { 'lazy' }
    }
  end
}
