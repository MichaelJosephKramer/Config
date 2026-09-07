return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/tokyonight.nvim" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" },
        component_separators = { left = "|", right = "|" },
      },
      sections = {
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "diagnostics" },
      },
      extensions = { "lazy" },
    })
  end,
}
