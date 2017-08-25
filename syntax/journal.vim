" ----------------------------------------------------------------------
" vim-journal   syntax file
" Maintainer:   Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" File:         syntax/journal.vim
" Source:       https://github.com/sgolitsynskiy/vim-journal
" License:      MIT
" Last Updated: 2017 Aug 24 09:58:26 PM CDT
" ----------------------------------------------------------------------

if version < 600
    syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax region journalTodo start=/\[ ]TODO/ end=/\n\n/
syntax region journalDone start=/\[x]TODO/ end=/\n\n/

syntax match journalSeparator /^=\+$/
syntax match journalDate /^[0-1][0-9]\/[0-3][0-9]\/[0-9][0-9][0-9][0-9]$/


" link to predefined highlight groups
highlight link journalTodo PreProc
highlight link journalDone Comment
highlight link journalSeparator Type
highlight link journalDate Type

let b:current_syntax = "journal"
