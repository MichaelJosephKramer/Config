-- Completion. Pinned to 1.x so lazy.nvim fetches the release tag that carries a
-- prebuilt Rust fuzzy matcher -- without it blink falls back to a Lua matcher
-- and wants a cargo toolchain to build its own.
return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    -- 'default' is the C-y-to-accept preset: C-space opens, C-n/C-p move,
    -- C-e hides. Deliberately keeps <Tab> free, which is what copilot.vim
    -- accepts its ghost text with (see plugins/init.lua).
    keymap = { preset = "default" },

    appearance = { nerd_font_variant = "mono" },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      -- Ghost text would collide with Copilot's, which occupies the same space.
      ghost_text = { enabled = false },
    },

    signature = { enabled = true },

    sources = {
      -- lazydev outranks the lsp source so Neovim API completions win in Lua
      -- files; it yields entirely in every other filetype.
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
