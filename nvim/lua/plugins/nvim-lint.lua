return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    require("lint").linters.luacheck.args = {
      "--globals", "vim",
      "--no-max-line-length",
      "--formatter", "plain",
      "--codes",
      "--ranges",
      "-",
    }
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      markdown = { "markdownlint" },
      python = { "ruff" },
      javascript = { "eslint_d" },
      ruby = { "rubocop" },
      yaml = { "yamllint" },
    }
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })
    require("lint").try_lint()
  end,
}
