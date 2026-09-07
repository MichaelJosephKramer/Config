-- Feeds lua_ls the Neovim runtime types on demand. Without it, hovering a
-- `vim.api.*` call in this repo returns `unknown` rather than a real signature,
-- since lua_ls has no idea the Neovim API exists.
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- vim.uv is used in init.lua's lazy.nvim bootstrap.
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
