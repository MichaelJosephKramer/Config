" ****************************************************************************** 
" ToggleRelativeNumber
" ****************************************************************************** 

function! ToggleRelativeNumber()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

function! SetRelativeNumberIfNumbersAreSet()
  if (&relativenumber || &number)
    set relativenumber
  endif
endfunc
