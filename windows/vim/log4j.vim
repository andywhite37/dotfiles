" Vim syntax file
" Language:         log4j input file
" Maintainer:       Andy White
" Latest Revision:  2009-10-28

if exists("b:current_syntax")
  finish
endif

syntax match log4jDateTime '^\d*[/-]\d*[/-]\d* \d*:\d*:\d* \([AP]M\)\?'
syntax match log4jThreadId '(\d*)'
syntax match log4jInformation '\[Information\]'
syntax match log4jError '\[Error\]'
syntax match log4jWarning '\[Warning\]'

let b:current_syntax = "log4j"

highlight log4jDateTime                guifg=Green
highlight log4jThreadId                guifg=Yellow
highlight log4jInformation             guifg=Blue
highlight log4jError                   guifg=Red
highlight log4jWarning                 guifg=Orange

