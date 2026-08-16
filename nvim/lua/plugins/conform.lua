return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      ["_"] = { "trim_whitespace", "trim_newlines" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      python = { "ruff_format" },
      javascript = { "prettierd" },
      ruby = { "rubocop" },
      yaml = { "prettierd" },
    },
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
  },
}
