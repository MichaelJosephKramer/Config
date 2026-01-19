--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------
local g   = vim.g
local opt = vim.opt

--------------------------------------------------------------------------------
-- MAPPINGS
--------------------------------------------------------------------------------

g.mapleader = ','
vim.keymap.set('n', '<F1>', '<Esc>')
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set('n', '<leader>w', ':wa<cr>')
vim.keymap.set('i', 'kj', '<Esc>')

--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------

opt.shortmess:append "cI" -- startup screen

opt.clipboard      = 'unnamedplus' -- default clipboard access
opt.expandtab      = true          -- spaces, not tabs
opt.exrc           = true          -- look for local config files
opt.number         = true          -- line numbers
opt.relativenumber = true          -- relative numbers
opt.scrolloff      = 10            -- scroll padding
opt.secure         = true          -- this has got to be smart, right?
opt.shiftwidth     = 2             -- width of the tab for indentation
opt.showmatch      = true          -- matching pairs
opt.softtabstop    = 2             -- width of the tab for tab
opt.termguicolors  = true          -- true colors

-- change colors past 120 characters
opt.colorcolumn = table.concat(vim.fn.range(121, 999), ',')

-- listchars characters
opt.listchars = {
  eol      = '↲',
  extends  = '»',
  precedes = '«',
  tab      = '▸▸',
  trail    = '·',
}

-- turn off relativenumber in insert mode
local numbering = vim.api.nvim_create_augroup('numbering', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
  group = numbering,
  callback = function() vim.opt_local.relativenumber = false end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  group = numbering,
  callback = function() vim.opt_local.relativenumber = true end,
})

-- remove line numbers on the terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('terminal_open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

--------------------------------------------------------------------------------
-- DIAGNOSTICS
--------------------------------------------------------------------------------

local symbols = {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN]  = '󰀪 ',
  [vim.diagnostic.severity.INFO]  = '󰋽 ',
  [vim.diagnostic.severity.HINT]  = '󰌶 ',
}
vim.diagnostic.config({
  float = {
    enable = true,
    border = "rounded",
    format = function(diagnostic)
      return string.format("%s: %s", symbols[diagnostic.severity], diagnostic.message)
    end,
    scope = "buffer",
  },
  severity_sort = true,
  signs = {
    enable = true,
    text = symbols,
  },
  underline = {
    enable = true,
  },
  update_in_insert = false,
  virtual_text = {
    enable = true,
    prefix = function(diagnostic)
      return string.format("%s:", symbols[diagnostic.severity])
    end,
  },
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open diagnostic float" })

--------------------------------------------------------------------------------
-- SEARCH
--------------------------------------------------------------------------------

opt.gdefault   = true    -- default to global
opt.ignorecase = true    -- ignore case
opt.signcolumn = 'yes:2' -- sign column width
opt.smartcase  = true    -- use case if specified

-- command line settings
opt.wildignore = { '*.git', 'bundle' }
opt.wildmenu   = true
opt.wildmode   = 'longest:full'

--------------------------------------------------------------------------------
-- NETWR
--------------------------------------------------------------------------------

g.netrw_altfile    = 1
g.netrw_banner     = 0
g.netrw_fastbrowse = 0

--------------------------------------------------------------------------------
-- DISABLE DEFAULTS
--------------------------------------------------------------------------------

opt.foldenable  = false -- folding
opt.swapfile    = false -- swapfile
opt.writebackup = false -- backup file

--------------------------------------------------------------------------------
-- PLUGINS
--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")
