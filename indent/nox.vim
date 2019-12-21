setlocal indentexpr=NoxIndent()

function! NoxIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  " && line !~ ":$"
  if previous =~ "{" && previous !~ "}" && line !~ "}"
    return indent(previousNum) + &tabstop
  endif
endfunction
