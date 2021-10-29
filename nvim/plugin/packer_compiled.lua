-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/michael/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/michael/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/michael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/michael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/michael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.ale\frequire\0" },
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  fzf = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    commands = { ":Buffers", ":GFiles", ":Files", ":Lines", ":Marks", ":Snippets", ":Rg", ":Tags" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0" },
    keys = { { "", "<leader>b" }, { "", "<leader>t" }, { "", "<leader>f" }, { "", "<leader>l" }, { "", "<leader>m" }, { "", "<leader>s" }, { "", "<leader>r" }, { "", "<leader>c" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  indentLine = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.indentline\frequire\0" },
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["lightline-ale"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/lightline-ale",
    url = "https://github.com/maximbaz/lightline-ale"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.lightline\frequire\0" },
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  tabular = {
    after_files = { "/Users/michael/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tagbar = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tagbar\frequire\0" },
    keys = { { "", "<F8>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["tokyonight.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-commentary"] = {
    keys = { { "", "gcc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.vim-test\frequire\0" },
    keys = { { "", "t<C-n>" }, { "", "t<C-f>" }, { "", "t<C-a>" }, { "", "t<C-l>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/vim-test",
    url = "https://github.com/janko-m/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    keys = { { "", "-" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/michael/.local/share/nvim/site/pack/packer/opt/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.lightline\frequire\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: indentLine
time([[Config for indentLine]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.indentline\frequire\0", "config", "indentLine")
time([[Config for indentLine]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)

time([[Config for tokyonight.nvim]], false)
-- Config for: ale
time([[Config for ale]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.ale\frequire\0", "config", "ale")
time([[Config for ale]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[au CmdUndefined :Files ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Lines ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Marks ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Snippets ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Rg ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Tags ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :Buffers ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :GFiles ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F8> <cmd>lua require("packer.load")({'tagbar'}, { keys = "<lt>F8>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>c <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>c", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>r <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>r", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t<C-f> <cmd>lua require("packer.load")({'vim-test'}, { keys = "t<lt>C-f>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>f <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>b <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>m <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>l <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>l", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t<C-l> <cmd>lua require("packer.load")({'vim-test'}, { keys = "t<lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t<C-a> <cmd>lua require("packer.load")({'vim-test'}, { keys = "t<lt>C-a>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t<C-n> <cmd>lua require("packer.load")({'vim-test'}, { keys = "t<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> - <cmd>lua require("packer.load")({'vim-vinegar'}, { keys = "-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>t <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>leader>t", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
