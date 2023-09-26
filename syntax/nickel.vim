if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "nickel"

" Comments
syntax region nickelComment start="#" end="$" contains=@Spell oneline display

" Commands
syntax keyword nickelKeywords
    \ let
    \ in
    \ fun
    \ rec

syntax keyword nickelImport import

" Control flow
syntax keyword nickelControlFlow
    \ if
    \ then
    \ else
    \ match

syntax keyword nickelMetadata
    \ doc
    \ default
    \ force
    \ optional
    \ priority


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

syntax match nickelParens "{\|}\|(\|)\|\[\|\]\|,"

" Identifier
syntax match nickelIdentifier "\v<[a-z_][a-zA-Z0-9-_']*>"
syntax match nickelBuiltin "\v\%[a-zA-Z0-9_]*\%"

syntax keyword nickelTypeContract forall

" Types and Contracts (convention)
" Include contracts extracted from a record, like num.Nat. This matches a
" sequence of record field access which ends with an identifier starting with an
" upper-case letter.
syntax match nickelTypeContract "\v<([a-z_][a-zA-Z0-9-_']*\.)*[A-Z][a-zA-Z0-9_]*>"

" Single enum tag
syntax match nickelEnumTag "\v'[a-zA-Z_][a-zA-Z0-9-_']*>"
syntax region nickelEnumTag start=+'"+ skip=+\\"+ end=+"+ oneline

" Enum type
syntax region nickelTypeContract start=+\[|+ end=+|]+ contains=nickelEnumTag

syntax match nickelInterpolation1 "\v\%\{([^\}]|\n)*\}" contains=nickelComment,nickelKeywords,nickelImport,nickelControlFlow,nickelMetadata,nickelOperator,nickelParens,nickelIdentifier,nickelBuiltin,nickelTypeContract,nickelEnumTag,nickelString,nickelFloat,nickelHex
syntax match nickelInterpolation2 "\v\%\%\{([^\}]|\n)*\}" contains=nickelComment,nickelKeywords,nickelImport,nickelControlFlow,nickelMetadata,nickelOperator,nickelParens,nickelIdentifier,nickelBuiltin,nickelTypeContract,nickelEnumTag,nickelString,nickelFloat,nickelHex
syntax match nickelInterpolation3 "\v\%\%\%\{([^\}]|\n)*\}" contains=nickelComment,nickelKeywords,nickelImport,nickelControlFlow,nickelMetadata,nickelOperator,nickelParens,nickelIdentifier,nickelBuiltin,nickelTypeContract,nickelEnumTag,nickelString,nickelFloat,nickelHex
syntax match nickelInterpolation4 "\v\%\%\%\%\{([^\}]|\n)*\}" contains=nickelComment,nickelKeywords,nickelImport,nickelControlFlow,nickelMetadata,nickelOperator,nickelParens,nickelIdentifier,nickelBuiltin,nickelTypeContract,nickelEnumTag,nickelString,nickelFloat,nickelHex

" Strings
syntax region nickelString start=+"+ skip=+\\"+ end=+"+ contains=nickelInterpolation1 oneline
syntax region nickelString start=!\([a-z]\+-s\|m\)%"! end=+"%+ contains=nickelInterpolation1
syntax region nickelString start=!\([a-z]\+-s\|m\)%%"! end=+"%%+ contains=nickelInterpolation2
syntax region nickelString start=!\([a-z]\+-s\|m\)%%%"! end=+"%%%+ contains=nickelInterpolation3
syntax region nickelString start=!\([a-z]\+-s\|m\)%%%%"! end=+"%%%%+ contains=nickelInterpolation4

" Number
syntax match nickelFloat "\v[+-]?\d+((\.\d+)?([eE][+-]?\d+)?)?"
" Float starting by a dot
syntax match nickelFloat "\v[+-]?\.\d+([eE][+-]?\d+)?"
syntax match nickelHex "\v0[xX][0-9a-fA-F]+"

hi def link nickelComment        Comment
hi def link nickelKeywords       Keyword
hi def link nickelMetadata       Special
hi def link nickelImport         Include
hi def link nickelControlFlow    Statement
hi def link nickelOperator       Operator
hi def link nickelParens         Special
hi def link nickelInterpolation1 Normal
hi def link nickelInterpolation2 Normal
hi def link nickelInterpolation3 Normal
hi def link nickelInterpolation4 Normal
hi def link nickelTypeContract   Type
hi def link nickelEnumTag        Constant
hi def link nickelIdentifier     Normal
hi def link nickelBuiltin        Function
hi def link nickelString         String
hi def link nickelFloat          Float
hi def link nickelHex            Number
