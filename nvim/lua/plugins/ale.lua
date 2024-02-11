return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_echo_msg_format = '[%linter%]: %s ( %severity% )'
    vim.g.ale_fix_on_save = 1
    vim.g.ale_fixers = {
      ['*']              = { 'remove_trailing_lines', 'trim_whitespace' },
      javascript         = { 'eslint' },
      ['javascript.jsx'] = { 'eslint' },
      ruby               = { 'rubocop' },
    }
    vim.g.ale_lint_on_enter = 1
    vim.g.ale_linters = {
      lua  = { 'luac', 'luacheck' },
      ruby = { 'rubocop' }
    }
  end
}
