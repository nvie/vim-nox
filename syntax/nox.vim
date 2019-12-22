syntax match noxComment "\v\/\/.*$" oneline
syntax region noxComment start="/\*" end="\*/" fold

syntax keyword noxImport import skipwhite skipempty nextgroup=noxImportDestructuring,noxImportIdentifier
syntax region noxImportDestructuring start="\v\{" end="\v\}" skipwhite skipempty contained containedin=noxImport contains=noxIdentifier nextgroup=noxImportFromClause
syntax match noxImportIdentifier "\v<[A-Za-z_$]+>" skipwhite skipempty contained containedin=noxImport nextgroup=noxImportFromClause
syntax keyword noxImportFromClause from skipwhite skipempty nextgroup=noxIdentifier

syntax match noxIdentifier "\v<[A-Za-z_$]+>"

syntax keyword noxTodos TODO XXX FIXME NOTE
syntax keyword noxKeywords
    \ do
    \ for
    \ from
    \ func
    \ generator
    \ in
    \ mutates
    \ return
    \ while
    \ yield
syntax match noxKeywords /io func/

" Pattern match syntax should blend in with normal keywords
syntax match noxKeywords /\v\|/
syntax match noxKeywords /\v-\>/

syntax match noxArrow /\v\=\>/

" Literals
syntax match noxFloat "\v<\d+\.\d+>"
syntax match noxInt "\v<\d+>"
syntax match noxBool "\v<True>"
syntax match noxBool "\v<False>"

" Too simplistic
syntax region noxDoubleQuotedString start='\v"' skip='\v\\"' end='\v"' end='\v$' oneline
syntax region noxSingleQuotedString start="\v'" skip="\v\\'" end="\v'" end='\v$' oneline
syntax region noxTemplateString start="\v`" skip="\v\\`" end="\v`" contains=noxInterpolation
syntax region noxVerbatimTemplateString start="\v``" skip="\v\\`" end="\v``"

syntax region noxInterpolation start="\v\{\s*" end="\v\s*\}" contained containedin=noxTemplateString contains=@noxExpr

syntax match noxFunctionCall "\v<[a-z]\w*>\ze\s*\("
"                                         ^^^ This \ze sets the "end" of the match
syntax match noxType "\v<[A-Z]\w*>"

" Expression
syntax cluster noxExpr contains=noxFloat,noxInt,noxBool,noxDoubleQuotedString,noxSingleQuotedString,noxTemplateString,noxVerbatimTemplateString,noxFunctionCall

" Set highlights
highlight default link noxComment Comment
highlight default link noxTodos Todo
highlight default link noxKeywords Keyword
highlight default link noxFloat Number
highlight default link noxInt Number
highlight default link noxBool Boolean
highlight default link noxDoubleQuotedString String
highlight default link noxSingleQuotedString String
highlight default link noxVerbatimTemplateString String
highlight default link noxTemplateString String
highlight default link noxType Type
highlight default link noxArrow Type
highlight default link noxFunctionCall Function
highlight default link noxImport Include
highlight default link noxImportFromClause Include

" Identifiers aren't that nice
" highlight default link noxIdentifier Identifier
