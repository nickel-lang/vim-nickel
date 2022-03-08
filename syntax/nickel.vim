if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "nickel"

" Comments
syntax region nickelComment start="#" end="$" contains=@Spell oneline display

" Commands
syntax keyword nickelKeywords
    \ switch
    \ import
    \ if
    \ else
    \ then
    \ let
    \ in
    \ doc
    \ default
    \ fun
    \ forall

" Operators
syntax keyword nickelOperator
    \ ==
    \ !=
    \ <
    \ <=
    \ >
    \ >=
    \ &&
    \ \|\|
    \ +
    \ -
    \ *
    \ /
    \ ++
    \ @
    \ ->
    \ :
    \ \|
    \ =
    \ %

" Types and Contracts (convention)
syntax match nickelTypeContract "\v<[A-Z_\$][a-zA-Z0-9_\$]*>"

" Identifier
syntax match nickelIdentifier "\v<[a-z_\$][a-zA-Z0-9-_\$]*>"
syntax match nickelBuiltin "\v\%[a-zA-Z0-9_\$]*\%"

" Strings
syntax region nickelString start=+"+ skip=+\\"+ end=+"+ oneline
syntax region nickelString start=+m%"+ end=+"%m+
syntax region nickelString start=+m%%"+ end=+"%%m+
syntax region nickelString start=+m%%%"+ end=+"%%%m+

" Number
syntax match nickelInt "[0-9]\+"
syntax match nickelHex "0[xX][0-9a-fA-F]\+\\b"
syntax match nickelFloat "[+-]?\\d\+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d\+)?)?\\b"

highlight def link nickelComment      Comment
highlight def link nickelKeywords     Function
highlight def link nickelOperator     Operator
highlight def link nickelTypeContract Type
highlight def link nickelIdentifier   Normal
highlight def link nickelBuiltin      Special
highlight def link nickelString       String
highlight def link nickelFloat        Float
highlight def link nickelHex          Number
highlight def link nickelInt          Number
