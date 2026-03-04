return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>m", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown rendering" },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
    local bg = vim.api.nvim_get_hl(0, { name = "Visual" }).bg
    if bg then
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = bg })
      vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { bg = bg })
    end
  end,
  opts = {
    heading = {
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      backgrounds = {},
    },
  },
}
