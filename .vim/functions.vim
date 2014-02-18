" ******************************************************************************
" ToggleColor
" ******************************************************************************

function! ToggleColor()
  if (g:colors_name == "vividchalk")
    :exec "color summerfruit256"
  else
    :exec "color vividchalk"
  endif

  highlight cursorline cterm=bold
endfunc
