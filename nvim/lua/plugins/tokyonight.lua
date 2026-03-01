return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup({
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
      on_highlights = function(highlights, colors)
        highlights.DiagnosticVirtualTextError.bg = colors.none
        highlights.DiagnosticVirtualTextHint.bg = colors.none
        highlights.DiagnosticVirtualTextInfo.bg = colors.none
        highlights.DiagnosticVirtualTextWarn.bg = colors.none
      end,
      styles = { floats = "dark" },
      transparent = true,
    })
    vim.cmd([[ colorscheme tokyonight-night ]])
  end,
}
