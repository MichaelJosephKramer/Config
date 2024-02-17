return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      additional_vim_regex_highlighting = false,
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
      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
    })
  end
}
