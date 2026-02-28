return {
  'mfussenegger/nvim-lint',
  event = { 'BufEnter', 'BufWritePost', 'InsertLeave' },
  config = function()
    require('lint').linters_by_ft = {
      python     = { 'ruff' },
      javascript = { 'eslint_d' },
      ruby       = { 'rubocop' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
