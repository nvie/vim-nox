syntax match noxComment ,\v//.*$,
syntax region noxComment start=,\v/\*, end=,\v\*/, fold

syntax keyword noxImport import skipwhite skipempty nextgroup=noxImportDestructuring,noxImportIdentifier
syntax region noxImportDestructuring start=/\v\{/ end=/\v\}/ skipwhite skipempty contained containedin=noxImport contains=noxIdentifier nextgroup=noxImportFromClause
syntax match noxImportIdentifier /\v<[A-Za-z_$]+>/ skipwhite skipempty contained containedin=noxImport nextgroup=noxImportFromClause
syntax keyword noxImportFromClause from skipwhite skipempty nextgroup=noxIdentifier

syntax match noxTypeName /\v<[A-Z][a-zA-Z0-9_$]+>/
syntax match noxIdentifier /\v<[a-z][a-z0-9_$]+>/
syntax match noxSymbol /:\v<[A-Z][a-zA-Z0-9_$]+>/

syntax keyword noxSelf
    \ self
    \ Self

syntax keyword noxTodos TODO XXX FIXME NOTE contained containedin=noxComment
syntax keyword noxKeywords
    \ alias
    \ do
    \ else
    \ enum
    \ export
    \ for
    \ forever
    \ from
    \ func
    \ generator
    \ if
    \ in
    \ match
    \ mut
    \ mutates
    \ return
    \ type
    \ union
    \ while
    \ yield
    \ _
syntax match noxKeywords /\vio func/

" Pattern match syntax should blend in with normal keywords
syntax match noxKeywords /\v\|/
syntax match noxKeywords /\v-\>/

syntax match noxArrow /\v\=\>/

" Literals
syntax match noxInt /\v<\d+(_\d+)*>/
syntax match noxFloat /\v<\d+(_\d+)*\.\d+(_\d+)*>/

" Too simplistic
syntax region noxDoubleQuotedString start=/\v"/ skip=/\v\\./ end=/\v"/ end=/\v$/ oneline
syntax region noxSingleQuotedString start=/\v'/ skip=/\v\\./ end=/\v'/ end=/\v$/ oneline
syntax region noxTemplateString start=/\v`/ skip=/\v\\./ end=/\v`/ contains=noxInterpolation
syntax region noxVerbatimTemplateString start=/\v``/ skip=/\v\\./ end=/\v``/

syntax region noxInterpolation start=/\v\{\s*/ end=/\v\s*\}/ contained containedin=noxTemplateString contains=@noxExpr

syntax match noxFunctionCall /\v<[a-z]\w*>\ze(\s*[<][^>]+[>])?\s*\(/
"                                         ^^^ This \ze sets the "end" of the match

" Expression
syntax cluster noxExpr contains=noxFloat,noxInt,noxSymbol,noxDoubleQuotedString,noxSingleQuotedString,noxTemplateString,noxVerbatimTemplateString,noxFunctionCall

" Common syntax errors due to poor (JS-infected) muscle memories
syntax match noxCommonError /\v[!=]\=\zs\=/
syntax match noxCommonError /\v[;]*\s*$/
syntax match noxCommonError /\v<[a-z][A-Za-z0-9_$]*\zs[A-Z][A-Za-z0-9_$]*>/  " unlearn camelCase

" Set highlights
highlight default link noxComment Comment
highlight default link noxTodos Todo
highlight default link noxKeywords Keyword
highlight default link noxFloat Number
highlight default link noxInt Number
highlight default link noxSelf Boolean
highlight default link noxSymbol Boolean
highlight default link noxDoubleQuotedString String
highlight default link noxSingleQuotedString String
highlight default link noxVerbatimTemplateString String
highlight default link noxTemplateString String
highlight default link noxTypename Type
highlight default link noxArrow Type
highlight default link noxFunctionCall Function
highlight default link noxImport Include
highlight default link noxImportFromClause Include
highlight default link noxCommonError Error

" Identifiers aren't that nice
" highlight default link noxIdentifier Identifier
