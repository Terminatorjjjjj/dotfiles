local opt_s = { noremap = true, silent = true }

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', opt_s)
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', opt_s)

-- Verilog non-blocking auto align
vim.keymap.set('i', '<=', '<=<Esc>mzvip:EasyAlign/<=/<CR>`z$a<Space>', opt_s)

-- Customized setting mainly for verilog
-- d: for aligning port/signal list with last space before ,;=)
vim.cmd [[
let g:easy_align_delimiters = {
    \ '/': {
    \     'pattern':         '//\+\|/\*\|\*/',
    \     'delimiter_align': 'l',
    \     'ignore_groups':   ['!Comment'] 
    \ },
    \ ':': {
    \     'pattern':       ':',
    \     'left_margin':   1,
    \     'right_margin':  1,
    \ },
    \ '?': {
    \     'pattern':       '?',
    \     'left_margin':   1,
    \     'right_margin':  1,
    \ },
    \ '(': {
    \     'pattern':       '(',
    \     'left_margin':   1,
    \     'right_margin':  0,
    \ },
    \ ')': {
    \     'pattern':       ')',
    \     'left_margin':   1,
    \     'right_margin':  0,
    \ },
    \ 'd': {
    \     'pattern':      ' \ze\S\+\s*[,;=]',
    \     'left_margin':  0,
    \     'right_margin': 0
    \ }}
]]
