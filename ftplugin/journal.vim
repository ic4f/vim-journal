" ----------------------------------------------------------------------
" vim-journal   filetype plugin / journal for Vim
" Maintainer:   Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" File:         ftplugin/journal.vim
" Source:       https://github.com/sgolitsynskiy/vim-journal
" License:      MIT
" Last Updated: 2017 Aug 26 02:11:37 PM CDT
" ----------------------------------------------------------------------


" prevent from loading twice; to disable plugin uncomment next line
"let b:journal_loaded = 1
if exists("b:journal_loaded")
  finish
endif
let b:journal_loaded = 1

" these markers are used by summary blocks
setlocal foldmethod=marker

" try to switch to writing mode (vim-write must be installed)
call journal#set_writingmode()


" add mappings to these commands in .vimrc
if !exists(":JournalInsertDate")
    command JournalInsertDate call journal#insert_date()
endif

if !exists(":JournalInsertTodo")
    command JournalInsertTodo call journal#insert_todo()
endif

if !exists(":JournalMakeSummaries")
    command! JournalMakeSummaries call journal#make_summaries()
endif


"setup options
let g:journal_options = {}
let g:journal_options.regex_prefix = "^"
let g:journal_options.suffix = ": "
let g:journal_options.todo = "[ ]TODO: "


"init term list
let g:journal_terms = []


"===============================================================================
" autocommands
"===============================================================================
augroup journal_start
    autocmd!
    "go to end of file; move last line to center of screen and scroll
    autocmd BufEnter <buffer> normal! Gz.
augroup END


