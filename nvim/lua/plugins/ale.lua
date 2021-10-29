--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------

local cmd = vim.cmd
local g = vim.g

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------

g.ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

-- autofix
g.ale_fix_on_save = 1

-- ale linters
g.ale_linters = {
  lua = { 'luac', 'luacheck' },
  ruby = { 'rubocop' }
}

-- ale fixers
g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = { 'eslint' },
  ['javascript.jsx'] = { 'eslint' },
  ruby = { 'rubocop' },
}

-- ale linting configuration
g.ale_lint_on_enter = 1

-- add sign column emoticons
cmd [[
  let g:ale_sign_error = "\u2718"
  let g:ale_sign_warning = "\u279c"
]]

-- ale colors for highlights
cmd [[
  augroup ale_highlights
    autocmd!
    autocmd ColorScheme * highlight ALEError ctermbg=88 guibg=#870000
    autocmd ColorScheme * highlight ALEErrorSign ctermfg=196 guifg=#ff0000
    autocmd ColorScheme * highlight ALEWarning ctermbg=8 guibg=#808080
    autocmd ColorScheme * highlight ALEWarningSign ctermfg=226 guifg=#ffff00
  augroup end
]]
