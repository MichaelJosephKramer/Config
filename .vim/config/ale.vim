" --- ALE ---

" message format
let g:ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

" enable credo strict mode
let g:ale_elixir_credo_strict = 1

" autofix
let g:ale_fix_on_save = 1

let g:ale_linters = {
\  'elixir': ['elixir-ls'],
\  'ruby': ['rubocop', 'ruby_lsp'],
\  'rust': ['rust-analyzer'],
\}

" ale fixers
let g:ale_fixers = {
      \  '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'elixir': [
      \   'mix_format',
      \  ],
      \  'javascript': [
      \   'eslint',
      \  ],
      \  'javascript.jsx': [
      \   'eslint',
      \  ],
      \  'ruby': [
      \   'rubocop',
      \  ],
      \  'rust': [
      \   'rustfmt',
      \  ],
      \}

" ale linting configuration
let g:ale_lint_on_enter = 0

" add sign column emoticons
let g:ale_sign_warning = "\u279c"
let g:ale_sign_error = "\u2718"

" ale colors for highlights
augroup ale_highlights
  autocmd!
  autocmd ColorScheme * highlight ALEError ctermbg=88
  autocmd ColorScheme * highlight ALEErrorSign ctermfg=196
  autocmd ColorScheme * highlight ALEWarning ctermbg=8
  autocmd ColorScheme * highlight ALEWarningSign ctermfg=226
augroup end
