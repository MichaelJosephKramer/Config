return {
  'dense-analysis/ale',
  event = { 'BufReadPost', 'BufNewFile' },
  init = function()
    vim.g.ale_echo_msg_format = '[%linter%]: %s ( %severity% )'
    vim.g.ale_fix_on_save = 1
    vim.g.ale_fixers = {
      ['*']        = { 'remove_trailing_lines', 'trim_whitespace' },
      python       = { 'ruff' },
      javascript   = { 'eslint' },
      ruby         = { 'rubocop' },
    }
    vim.g.ale_lint_on_enter = 1
  end,
}
