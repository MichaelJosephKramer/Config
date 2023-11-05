return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  dependencies = { 'nvim-treesitter/nvim-treesitter-refactor' },
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "lua",
        "python",
        "ruby",
        "rust",
        "vimdoc"
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
      refactor = {
        highlight_definitions = { enable = true },
        navigation            = { enable = true },
        smart_rename          = { enable = true },
      },
      sync_install = false,
    })
  end
}
