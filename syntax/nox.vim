syntax match noxComment "\v\/\/.*$" oneline
syntax region noxComment start="/\*" end="\*/" fold

syntax keyword noxTodos TODO XXX FIXME NOTE
syntax keyword noxKeywords
    \ io
    \ func
    \ return
    \ for
    \ in
    \ while
    \ do
    \ mutates
    \ generator
    \ yield

" Literals
syntax match noxFloat "\v<\d+\.\d+>"
syntax match noxInt "\v<\d+>"
syntax match noxBool "\v<True>"
syntax match noxBool "\v<False>"

" Too simplistic
syntax match noxString "\v\".*\""

" syntax match region noxString start=/"/ skip=/\\"/ end=/"/ oneline contains=noxInterpolatedWrapper
" syntax match region noxInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=noxString contains=noxInterpolatedString
" syntax match noxInterpolatedString "\v\w+(\(\))?" contained containedin=swiftInterpolatedWrapper

syntax match noxIdentifier "\v<[a-z]\w*>"
syntax match noxType "\v<[A-Z]\w*>"

" Set highlights
highlight default link noxComment Comment
highlight default link noxTodos Todo
highlight default link noxKeywords Keyword
highlight default link noxFloat Number
highlight default link noxInt Number
highlight default link noxBool Boolean
highlight default link noxString String
highlight default link noxIdentifier Identifier
highlight default link noxType Type
