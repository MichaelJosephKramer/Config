" Set font based on the operating system
if has('mac')
  set guifont=Consolas:h24
  set antialias
elseif has('unix')
  set guifont=Inconsolata\ Bold\ 14
elseif has('win32')
  set guifont=Consolas:h14:b:cANSI
endif

" Remove the menubar
set guioptions-=m

" Remove the toolbar
set guioptions-=T
