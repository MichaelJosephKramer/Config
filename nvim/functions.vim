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

function! JobHandler(job_id, data, event)
  let rubocop_message = get(a:data, 0, 'default')
  if rubocop_message =~ "[Corrected]"
    e %
  endif
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
