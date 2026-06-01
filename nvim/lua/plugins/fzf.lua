return {
  "ibhagwan/fzf-lua",
  opts = {
    "fzf-native",
    previewer = "builtin",
    winopts = {
      preview = { delay = 100 },
    },
    files = {
      git_icons = false,
      cmd = "fd --type f --hidden --exclude .git",
      formatter = "path.filename_first",
    },
    git = {
      files = {
        git_icons = false,
        cmd = "git ls-files --cached --others --exclude-standard",
        formatter = "path.filename_first",
      },
    },
  },
  keys = {
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "FzfLua buffers" },
    { "<leader>t", "<cmd>FzfLua git_files<cr>", desc = "FzfLua git files" },
    { "<leader>f", "<cmd>FzfLua files<cr>", desc = "FzfLua files" },
    { "<leader>l", "<cmd>FzfLua lines<cr>", desc = "FzfLua lines" },
    { "<leader>m", "<cmd>FzfLua marks<cr>", desc = "FzfLua marks" },
    { "<leader>r", "<cmd>FzfLua live_grep<cr>", desc = "FzfLua live grep" },
    { "<c-x><c-h>", "<cmd>FzfLua complete_line<cr>", mode = "i", desc = "FzfLua line completion" },
  },
}
