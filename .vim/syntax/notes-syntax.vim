" use with:
" :set syntax=notes-syntax.vim
" or better with au for .notes files.
"
:syntax clear

:highlight Normal ctermfg=White

:syntax match header /^[A-Za-z-=].*$/
:hi link header NonText

:syntax match subheader /^\t[A-Za-z0-9-=].*$/
:hi link subheader Statement 

" TODO: this is a simple TODO line.
" We also want to support TODO(reuven): for example 
:syntax match ToDo /TODO.*: / containedin=header,subheader
:highlight ToDo ctermfg=Red ctermbg=Black

