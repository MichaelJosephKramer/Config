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

augroup rubocop_linting
  autocmd!
  autocmd BufWritePre *.rb call RubocopFormat()
augroup END

function! RubocopFormat() abort

  " save cursor position, folds and many other things
  let l:curw = {}
  try
    mkview!
  catch
    let l:curw = winsaveview()
  endtry

  " save our undo file to be restored after we are done.
  let l:tmpundofile = tempname()
  exe 'wundo! ' . l:tmpundofile

  " write current unsaved buffer to a temporary file
  let l:tmpname = tempname() . '.rb'
  call writefile(getline(1, '$'), l:tmpname)

  " call rubocop on the temporary file
  let l:out = system('rubocop -a --except="RootCops/SpecFileName" -c ' . getcwd() . '/.rubocop.yml ' . l:tmpname)

  " if there is no error
  if v:shell_error == 0
    echo v:shell_error
    try | silent undojoin | catch | endtry

    " replace current file with temp file, then reload buffer
    let l:old_fileformat = &fileformat
    call rename(l:tmpname, expand('%'))
    silent edit!
    let &fileformat = l:old_fileformat
    let &syntax = &syntax
  endif

  " save our undo history
  silent! exe 'rundo ' . l:tmpundofile
  call delete(l:tmpundofile)

  " restore our cursor/windows positions, folds, etc..
  if empty(l:curw)
    silent! loadview
  else
    call winrestview(l:curw)
  endif
endf
