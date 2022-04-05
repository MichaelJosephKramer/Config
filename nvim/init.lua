--------------------------------------------------------------------------------
-- ALIASES
--------------------------------------------------------------------------------

local cmd = vim.cmd
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
cmd [[
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
cmd [[
  augroup numbering
    autocmd!
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
  augroup end
]]

-- remove line numbers on the terminal
cmd [[
  augroup neovim_terminal_open
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]]

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

-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- packer setup
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'dense-analysis/ale',
    config = { function() require 'plugins.ale' end }
  }
  use {
    'godlygeek/tabular',
    cmd = { 'Tabularize' }
  }
  use {
    'itchyny/lightline.vim',
    config = { function() require 'plugins.lightline' end },
    requires = { 'maximbaz/lightline-ale' }
  }
  use {
    'folke/tokyonight.nvim',
    config = cmd [[
      let g:tokyonight_style = "night"
      colorscheme tokyonight
      highlight comment cterm=italic gui=italic
      highlight htmlarg cterm=italic gui=italic
      hi Search cterm=underline
      hi Normal ctermbg=NONE guibg=NONE
    ]]
  }
  use {
    'github/copilot.vim'
  }
  use {
    'janko-m/vim-test',
    config = function() require 'plugins.vim-test' end,
    keys = { 't<C-n>', 't<C-f>', 't<C-a>', 't<C-l>' }
  }
  use {
    'junegunn/fzf.vim',
    config = { function() require 'plugins.fzf' end },
    cmd = { ':Buffers', ':GFiles', ':Files', ':Lines', ':Marks', ':Snippets', ':Rg', ':Tags' },
    keys = { '<leader>b', '<leader>t', '<leader>f', '<leader>l', '<leader>m', '<leader>s', '<leader>r', '<leader>c' },
    requires = { 'junegunn/fzf', run  = ":call fzf#install()" }
  }
  use {
    'majutsushi/tagbar',
    config = function() require 'plugins.tagbar' end,
    keys = { '<F8>' }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = { 'nvim-treesitter/nvim-treesitter-refactor' },
    config = function() require 'plugins.nvim-treesitter' end
  }
  use {
    'SirVer/ultisnips',
    requires = { 'honza/vim-snippets', opt=true }
  }
  use {
    'tpope/vim-commentary',
    keys = { 'gcc' }
  }
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use {
    'tpope/vim-vinegar',
    keys =  "-"
  }
  use {
    'Yggdroot/indentLine',
    config = function() require 'plugins.indentline' end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
