setlocal indentexpr=NoxIndent()

function! NoxIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "{" && previous !~ "}"
    if line =~ "}"
      return indent(previousNum)
    else
      return indent(previousNum) + &tabstop
    endif
  else
    if line =~ "}"
      return indent(previousNum) - &tabstop
    else
      return indent(previousNum)
    endif
  endif
endfunction
