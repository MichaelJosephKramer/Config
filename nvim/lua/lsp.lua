local nvim_lsp = require'lspconfig'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
  require'diagnostic'.on_attach(client)
end

vim.api.nvim_call_function("sign_define", {"LspDiagnosticsSignError", {text = vim.g.vim_signs.error, texthl = "LspDiagnosticsSignError"}})
vim.api.nvim_call_function("sign_define", {"LspDiagnosticsSignWarning", {text = vim.g.vim_signs.warning, texthl = "LspDiagnosticsSignWarning"}})
vim.api.nvim_call_function("sign_define", {"LspDiagnosticsSignInformation", {text = vim.g.vim_signs.information, texthl = "LspDiagnosticsSignInformation"}})
vim.api.nvim_call_function("sign_define", {"LspDiagnosticsSignHint", {text = vim.g.vim_signs.hint, texthl = "LspDiagnosticsSignHint"}})

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_treesitter = true;
    path = true;
    tags = true;
    ultisnips = true;
  };
}
