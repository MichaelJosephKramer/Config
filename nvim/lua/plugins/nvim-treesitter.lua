--------------------------------------------------------------------------------
-- CONFIGURATION 
--------------------------------------------------------------------------------

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "html",
    "jsdoc",
    "javascript",
    "lua",
    "python",
    "ruby",
    "rust"
   },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = { enable = true },
    smart_rename = { enable = true },
  },
}
