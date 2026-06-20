-- NOTE: the `main` branch compiles parsers from grammar, so the `tree-sitter`
-- CLI must be on PATH (`brew install tree-sitter-cli`). Without it, builds fail
-- silently and stale parsers trigger query errors like
-- `Query error: Invalid field name "operator"`.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "cpp",
      "css",
      "elixir",
      "heex",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vimdoc",
      "yaml",
    })

    -- master's `highlight`/`indent` modules are gone on the main branch;
    -- wire them up via Neovim's native treesitter API per buffer.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.start, args.buf, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
