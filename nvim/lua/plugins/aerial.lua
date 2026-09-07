-- Symbol outline. Replaced tagbar, which shelled out to ctags on every toggle
-- and needed a separate binary in the Brewfile. aerial reads the LSP servers
-- that are already attached (falling back to treesitter), so the outline stays
-- correct as the buffer is edited instead of going stale between ctags runs.
return {
  "stevearc/aerial.nvim",
  keys = {
    { "<F8>", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
    { "[[", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
    { "]]", "<cmd>AerialNext<cr>", desc = "Next symbol" },
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown" },
    layout = { min_width = 30 },
    -- Matches the diagnostic symbols configured in init.lua.
    show_guides = true,
  },
}
