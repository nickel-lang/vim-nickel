setlocal indentexpr=NickelIndent()

function! NickelIndent()
    let line = getline(v:lnum)
    let previousNum = prevnonblank(v:lnum - 1)
    let previous = getline(previousNum)
    let currentIndent = indent(previousNum)
    let inMultiLine = 0

    if line =~ "\"%$" || line =~ "\"%,$"
      let b:NickelIndentinMultiLine = 0
      return currentIndent - &tabstop
    endif

    if b:NickelIndentinMultiLine == 1
        return currentIndent
    endif

    if previous =~ ",$"
        return currentIndent
    endif

    if line =~ "}$" || line =~ "},$" || line =~ "]$" || line =~ "],$"
        return currentIndent - &tabstop
    endif

    if previous =~ "{$" && previous !~ "}" && line !~ "}"
        return currentIndent + &tabstop
    endif

    if previous =~ "[$" && previous !~ "]" && line !~ "]"
        return currentIndent + &tabstop
    endif

    if previous =~ "if$" || previous =~ "then$" || previous =~ "else$"
        return currentIndent + &tabstop
    endif

    if previous =~ "m%\""
        let b:NickelIndentinMultiLine = 1
        return currentIndent + &tabstop
    endif


    if previous =~ "fun" && previous =~ "=>$"
        return currentIndent + &tabstop
    endif
endfunction
