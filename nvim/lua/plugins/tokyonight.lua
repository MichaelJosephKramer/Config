return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup({
      transparent = true,
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
      styles = { floats = "dark" }
    })
    vim.cmd[[ colorscheme tokyonight-night ]]
  end
}
