return {
  "vim-test/vim-test",
  -- vim-test reads these as vimscript globals, so they are set in `init` (which
  -- lazy.nvim runs at startup) rather than after the plugin loads.
  init = function()
    -- Default is `basic`, which shells out through `:!` and blocks the editor
    -- until the run finishes. `neovim` opens a terminal split instead, so the
    -- output is a scrollable buffer and nvim stays usable while tests run.
    vim.g["test#strategy"] = "neovim"
    -- Land in normal mode so the output is immediately navigable; <C-o> from
    -- init.lua still exits terminal mode when insert is wanted.
    vim.g["test#neovim#start_normal"] = 1
  end,
  keys = {
    { "t<C-n>", "<cmd>noautocmd wa<cr><cmd>TestNearest<cr>", desc = "Test nearest" },
    { "t<C-f>", "<cmd>noautocmd wa<cr><cmd>TestFile<cr>", desc = "Test file" },
    { "t<C-s>", "<cmd>noautocmd wa<cr><cmd>TestSuite<cr>", desc = "Test suite" },
    { "t<C-l>", "<cmd>noautocmd wa<cr><cmd>TestLast<cr>", desc = "Test last" },
    { "t<C-g>", "<cmd>noautocmd wa<cr><cmd>TestVisit<cr>", desc = "Test visit" },
  },
}
