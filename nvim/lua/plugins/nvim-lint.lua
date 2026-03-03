return {
  "mfussenegger/nvim-lint",
  event = { "BufEnter", "BufWritePost", "InsertLeave" },
  config = function()
    require("lint").linters.luacheck.args = {
      "--globals",
      "vim",
      "--no-max-line-length",
      "--formatter",
      "plain",
      "--codes",
      "--ranges",
      "-",
    }
    require("lint").linters.markdownlint.args = {
      "--stdin",
      "--disable",
      "MD013",
      "MD028",
      "MD033",
      "MD041",
      "--",
    }
    require("lint").linters_by_ft = {
      javascript = { "eslint_d" },
      lua = { "luacheck" },
      markdown = { "markdownlint" },
      python = { "ruff" },
      ruby = { "rubocop" },
      yaml = { "yamllint" },
    }
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
