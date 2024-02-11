return {
  'Yggdroot/indentLine',
  config = function()
    local g = vim.g

    g.indentLine_char = "┊"
    g.indentLine_fileTypeExclude = { "json", "sh" }
  end
}

