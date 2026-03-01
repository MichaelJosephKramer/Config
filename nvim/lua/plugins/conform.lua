return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters_by_ft = {
      ['_']        = { 'trim_whitespace', 'trim_newlines' },
      lua          = { 'stylua' },
      markdown     = { 'prettier' },
      python       = { 'ruff_format' },
      javascript   = { 'eslint_d' },
      ruby         = { 'rubocop' },
      yaml         = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = 'fallback',
    },
  },
}
