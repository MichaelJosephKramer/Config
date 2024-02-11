--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------
local g   = vim.g
local map = vim.api.nvim_set_keymap
local opt = vim.opt

--------------------------------------------------------------------------------
-- MAPPINGS
--------------------------------------------------------------------------------

g.mapleader = ',' -- leader
map('n', '<F1>', '<Esc>',        { noremap = true }) -- disable help
map('n', 'Q', '<Nop>',           { noremap = true }) -- disable ex mode
map('n', '<leader>w', ':wa<cr>', { noremap = true }) -- save all
map('i', 'kj', '<Esc>',          { noremap = true }) -- normal mode mapping

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
vim.cmd [[
let &colorcolumn="".join(range(121,999),",")
]]

-- listchars characters
opt.listchars = {
  eol      = '↲',
  extends  = '»',
  precedes = '«',
  tab      = '▸▸',
  trail    = '·',
}

-- turn off relativenumber in insert mode
vim.cmd [[
augroup numbering
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup end
]]

-- remove line numbers on the terminal
vim.cmd [[
augroup neovim_terminal_open
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]]

--------------------------------------------------------------------------------
-- DIAGNOSTICS
--------------------------------------------------------------------------------

local signs = {
  Error = '󰅚 ',
  Warn  = '󰀪 ',
  Info  = '󰋽 ',
  Hint  = '󰌶 ',
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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
if not vim.loop.fs_stat(lazypath) then
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
