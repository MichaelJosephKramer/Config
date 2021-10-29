--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local map = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------

g.lightline = {
  active = {
    right = { { 'lineinfo' }, { 'percent' }, { 'modified', 'fileformat', 'fileencoding', 'filetype' } },
    left = { {'mode', 'paste'}, {'branch'}, {'relativepath'}, { 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' }, {'treesitter'} },
  },
  colorscheme = 'tokyonight',
  component_function = {
    branch = 'fugitive#head',
    completion = 'Completion',
    treesitter = 'TreesitterLightline'
  },
  component_expand = {
    linter_checking = 'lightline#ale#checking',
    linter_warnings = 'lightline#ale#warnings',
    linter_errors = 'lightline#ale#errors',
    linter_ok = 'lightline#ale#ok',
  },
  component_type = {
    linter_checking = 'left',
    linter_warnings = 'warning',
    linter_errors = 'error',
    linter_ok = 'left',
  }
}

-- set the indicators
cmd [[
  let g:lightline#ale#indicator_ok = "\u2714 "
  let g:lightline#ale#indicator_warnings = "\u279c "
  let g:lightline#ale#indicator_errors = "\u2718 "
  let g:lightline#ale#indicator_checking = "\u29D7 "
]]

cmd [[
  function! TreesitterLightline()
    let l:status = nvim_treesitter#statusline(90)
    if l:status == 'null'
      return ''
    else
      return l:status
    endif
  endfunction

  autocmd VimEnter * call SetupLightlineColors()
  function SetupLightlineColors() abort
    " transparent background in statusbar
    let l:palette = lightline#palette()

    let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
    let l:palette.inactive.middle = l:palette.normal.middle
    let l:palette.tabline.middle = l:palette.normal.middle

    call lightline#colorscheme()
  endfunction
]]
