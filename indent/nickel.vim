setlocal indentexpr=NickelIndent()

function! NickelIndent()
    let line = getline(v:lnum)
    let previousNum = prevnonblank(v:lnum - 1)
    let previous = getline(previousNum)
    let currentIndent = indent(previousNum)

    if previous =~ "{$" && previous !~ "}" && line !~ "}"
        return currentIndent + &tabstop
    endif

    if previous =~ "if$" || previous =~ "then$" || previous =~ "else$"
        return currentIndent + &tabstop
    endif

    if previous =~ "fun" && previous =~ "=>$"
        return currentIndent + &tabstop
    endif
endfunction
