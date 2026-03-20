return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/tokyonight.nvim" },
  config = function()
    local function treesitter_context()
      local r = vim.fn["nvim_treesitter#statusline"](90)
      return type(r) == "string" and r or ""
    end

    require("lualine").setup({
      options = {
        theme = "tokyonight",
        section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" },
        component_separators = { left = "|", right = "|" },
      },
      sections = {
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", { treesitter_context }, "diagnostics" },
      },
      extensions = { "lazy" },
    })
  end,
}
