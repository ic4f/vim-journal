" ----------------------------------------------------------------------
" Vim syntax file for vim-journal
" Maintainer:   Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" File:         syntax/journal.vim
" Source:       https://github.com/sgolitsynskiy/vim-journal
" License:      MIT
" Last Updated: 2017 Aug 23 01:16:39 AM CDT
" ----------------------------------------------------------------------

if version < 600
    syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax region journalTodo start=/\[ ]TODO/ end=/\n\n/
syntax region journalDone start=/\[x]TODO/ end=/\n\n/

syntax match journalIdea /^IDEA./
syntax match journalObservation /^OBSERVATION./
syntax match journalThought /^THOUGHT./

syntax match journalSeparator /^=\+$/
syntax match journalDate /^[0-1][0-9]\/[0-3][0-9]\/[0-9][0-9][0-9][0-9]$/


" link to predefined highlight groups
highlight link journalTodo PreProc
highlight link journalDone Comment
highlight link journalSeparator Type
highlight link journalDate Type

highlight link journalIdea Identifier
highlight link journalObservation Constant
highlight link journalThought Underlined

let b:current_syntax = "journal"


