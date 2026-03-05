return {
  "ibhagwan/fzf-lua",
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
