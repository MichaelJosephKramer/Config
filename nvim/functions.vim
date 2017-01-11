" ******************************************************************************
" ToggleColor
" ******************************************************************************

function! ToggleColor()
  if (g:colors_name == "vividchalk")
    color summerfruit256
  else
    color vividchalk
  endif

  highlight cursorline cterm=bold
endfunc

" ******************************************************************************
" Rubocop Linting
" ******************************************************************************

function! JobHandler(_job_id, _data, _event)
  checktime
endfunction

augroup rubocop_linting
  autocmd!
  autocmd BufWrite *.rb
        \ if executable('rubocop') |
        \   call jobstart(
        \     'rubocop ' . expand('%') . ' -a',
        \     { 'on_stdout': function('JobHandler') }
        \   ) |
        \ endif
augroup END
