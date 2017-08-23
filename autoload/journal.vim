" ----------------------------------------------------------------------
" journal       filetype plugin / simple journal for Vim
" Maintainer:   Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" File:         autoload/journal.vim
" Source:       https://github.com/sgolitsynskiy/vim-journal
" License:      MIT
" Last Updated: 2017 Aug 23 01:16:41 AM CDT
" ----------------------------------------------------------------------


" insert new date
function! journal#insert_date()
    let l:sep = repeat("=", 78) "  separator (horizontal '=' line)
    " 2 lines down + separator + date + separator + 2 lines down
    let l:cmd = "normal! Go\<CR>" . l:sep . "\<CR>" .
                \ strftime("%m/%d/%Y") . "\<CR>\<CR>"
    execute l:cmd
endfunction


