return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters_by_ft = {
      ['*']        = { 'trim_whitespace', 'trim_newlines' },
      python       = { 'ruff_format' },
      javascript   = { 'eslint_d' },
      ruby         = { 'rubocop' },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = 'fallback',
    },
  },
}
