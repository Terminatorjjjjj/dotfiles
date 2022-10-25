-- Potential prefix: gc, gs, gb, gl, gy

local map = vim.keymap.set
local opt_n = { noremap = true }
local opt_s = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', opt_s)
map('n', '<Space>', ':', opt_n)
map('v', '<Space>', ':', opt_n)

-- Window cmd
map('n', 'gw', '<C-w>', opt_s)
-- Go to last buffer
map('n', 'gb', ':b#<CR>', opt_s)
map('n', '<C-h>', ':b#<CR>', opt_s)
-- Go to next window
map('n', 'gs', '<C-w>w', opt_s)
map('n', '<C-l>', '<C-w>w', opt_s)

-- Horizontal movement w/ easier pressing
map('n', 'H', '^', opt_s)
map('n', 'L', '$', opt_s)

-- Keeping search result centered
map('n', 'N', 'Nzzzv', opt_s)
map('n', 'n', 'nzzzv', opt_s)

-- Easy increase/decrease
map('n', '+', '<C-a>', opt_s)
map('n', '-', '<C-x>', opt_s)

-- Move line up/down
map('n', '<C-j>', ":m .+1<CR>", opt_s)
map('n', '<C-k>', ":m .-2<CR>", opt_s)
map('i', '<C-j>', ":m .+1<CR>gi", opt_s)
map('i', '<C-k>', ":m .-2<CR>gi", opt_s)
map('v', '<C-j>', ":m '>+1<CR>gv", opt_s)
map('v', '<C-k>', ":m '<-2<CR>gv", opt_s)

-- Toggle fold
map('n', "'", 'za', opt_s)
map('v', "'", 'za', opt_s)

-- Go to prev match history in command line, need to disable c-j/c-k in cmp
map('c', '<C-j>', '<Down>', opt_n)
map('c', '<C-k>', '<Up>', opt_n)

-- Quit terminal with Esc
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>', opt_s)

-- Selected keymaps from unimpaired
-- Insert blank line w/o moving cursor
map('n', '[<Space>', ":<C-u>put!=repeat([''],v:count)<bar>']+1<CR>", opt_s)
map('n', ']<Space>', ":<C-u>put =repeat([''],v:count)<bar>'[-1<CR>", opt_s)
-- Buffer navigation
map('n', '[b', ':bprevious<CR>', opt_s)
map('n', ']b', ':bnext<CR>', opt_s)
map('n', '[B', ':bfirst<CR>', opt_s)
map('n', ']B', ':blast<CR>', opt_s)
-- Quickfix list navigation
map('n', '[q', ':cprevious<CR>', opt_s)
map('n', ']q', ':cnext<CR>', opt_s)
map('n', '[Q', ':cfirst<CR>', opt_s)
map('n', ']Q', ':clast<CR>', opt_s)
