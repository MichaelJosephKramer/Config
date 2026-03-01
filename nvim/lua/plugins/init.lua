return {
  { 'github/copilot.vim', event = 'InsertEnter' },
  { 'godlygeek/tabular', cmd = 'Tabularize' },
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gvdiffsplit', 'Glog' } },
  { 'tpope/vim-surround', event = 'BufReadPost' },
  { 'tpope/vim-unimpaired', event = 'BufReadPost' },
  { 'tpope/vim-vinegar', keys = { '-' } },
}
