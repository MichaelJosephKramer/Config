return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
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

    -- Use the project's pinned ruff (nearest ancestor .venv), not Homebrew's
    -- global one: the global binary is far newer and its default rule set flags
    -- rules CI never enforces, since each repo pins an older ruff.
    local function project_ruff()
      local buf = vim.api.nvim_buf_get_name(0)
      local start = buf ~= "" and vim.fs.dirname(buf) or vim.fn.getcwd()
      local venv = vim.fs.find(".venv", { path = start, upward = true, type = "directory" })[1]
      if venv and vim.uv.fs_stat(venv .. "/bin/ruff") then
        return venv .. "/bin/ruff"
      end
      return "ruff"
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        require("lint").linters.ruff.cmd = project_ruff()
        require("lint").try_lint()
      end,
    })
  end,
}
