setlocal indentexpr=NoxIndent()

function! NoxIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  let prevOpened = previous =~ "{"
  let prevClosed = previous =~ "{.*}"
  let currClosed = line =~ "}"

  if prevOpened && !prevClosed
    if !currClosed
      return indent(previousNum) + &tabstop
    endif
  elseif !prevOpened
    if currClosed
      return indent(previousNum) - &tabstop
    endif
  endif

  " Comments -------------------------- {{{

  let prevOpened = previous =~ "[/][*]"
  let prevClosed = previous =~ "[*][/]"
  let currClosed = line =~ "[*][/]"

  if prevOpened && !prevClosed
    if !currClosed
      return indent(previousNum) + 1
    endif
  elseif prevClosed && !prevOpened
      return indent(previousNum) - 1
  endif

  " }}}

  " Pattern matching ------------------ {{{

  let prevCase = previous =~ '\v^\s*[|}]'
  let currCase = line =~ '\v^\s*\|'
  if currCase && !prevCase
    return indent(previousNum) + &tabstop
  elseif !currCase && prevCase
    return indent(previousNum) - &tabstop
  endif

  " }}}

  return indent(previousNum)
endfunction
