" ----------------------------------------------------------------------
" journal       filetype plugin / simple journal for Vim
" Maintainer:   Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" File:         ftplugin/journal.vim
" Source:       https://github.com/sgolitsynskiy/vim-journal
" License:      MIT
" Last Updated: 2017 Aug 23 01:16:37 AM CDT
" ----------------------------------------------------------------------


" prevent from loading twice; to disable plugin uncomment next line
"let b:journal_loaded = 1
if exists("b:journal_loaded")
  finish
endif
let b:journal_loaded = 1

" used by summary blocks
setlocal foldmethod=marker





" add shortcuts or mappings to these commands in your .vimrc
if !exists(":JournalInsertDate")
    command JournalInsertDate call journal#insert_date()
endif

" this goes into .vimrc
nnoremap <buffer> <unique> <silent> <LocalLeader>jd :JournalInsertDate<CR> 




"===============================================================================
" functions
"===============================================================================
function! s:SetupWritingMode()
    setlocal nonumber
    setlocal textwidth=80
    setlocal columns=100
    setlocal foldcolumn=10
    setlocal formatoptions=nt1
    setlocal formatprg=par
    setlocal nolist
    setlocal noautoindent
    setlocal nosmartindent
    setlocal nocindent
endfunction




"test


"===============================================================================
" autocommands
"===============================================================================
augroup main42
    autocmd!
    "go to end of file; move last line to center of screen and scroll
    autocmd BufEnter <buffer> normal! Gz.
augroup END


"===============================================================================
" mappings
"===============================================================================
" nnoremap <buffer> <unique> <silent> <LocalLeader>jd :call <SID>NewDate()<CR>i
" nnoremap <buffer> <unique> <silent> <LocalLeader>jd :call journal#insert_date()<CR>
nnoremap <buffer> <unique> <silent> <LocalLeader>jt o[ ]TODO: 
nnoremap <buffer> <unique> <silent> <LocalLeader>jh oTHOUGHT: 
nnoremap <buffer> <unique> <silent> <LocalLeader>ji oIDEA: 
nnoremap <buffer> <unique> <silent> <LocalLeader>jo oOBSERVATION: 


call s:SetupWritingMode()

"===============================================================================
"TEMPORARY CODE EXPERIMENTING
"===============================================================================

if !exists(":Jms")
    command! JMS call MakeSummaries()
endif

function! MakeSummaries()
    call cursor(1,1) " move cursor to top of file
    " mark first spot for summary block
    normal! mn

    call GetLines('^\[ ]TODO')
    call GetLines('^IDEA')
    call GetLines('^THOUGHT')
    call GetLines('^OBSERVATION')

    " close all folds
    normal! zM

endfunction


function! GetLines(pattern)

    " move to target
    normal `n

    " folding 
    execute "normal! i{{{ " . a:pattern . "\<cr>\<cr>"

    "set mark for target location inside summary block
    normal! mt

    execute "normal! o}}}" . a:pattern . "\<cr>\<cr>"

    " mark spot for next summary block below prev block
    normal! mn


    let l:line = search(a:pattern, 'W')
    while l:line > 0
        call ProcessPara()
        let l:line = search(a:pattern, 'W')
    endwhile

    normal! gg
endfunction


function! ProcessPara()
    " set marker in text
    normal! mk 
    " yank a paragraph
    normal! yap
    " move cursor to target location in summary block
    normal! `t

    " put yanked paragraph BEFORE mark
    normal! P


    "TODO: maybe set mark for end of last para?
    " move cursor back to mark in text
    normal! `k
endfunction

