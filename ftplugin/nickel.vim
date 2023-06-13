setlocal commentstring=#%s

if get(g:, 'nickel_recommended_style', 1)
    setlocal tabstop=2 shiftwidth=2 expandtab
endif

setlocal completefunc=syntaxcomplete#Complete
