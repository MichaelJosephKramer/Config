return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/tokyonight.nvim" },
  config = function()
    require("lualine").setup({
      options = { theme = "tokyonight" },
      sections = {
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "diagnostics" },
      },
      extensions = { "lazy" },
    })
  end,
}
