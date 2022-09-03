
-- Setting: {{{

vim.opt.expandtab = true
vim.opt.softtabstop = -1 -- if negative, shiftwidth is used
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wildignore = {'*.docx' ,'*.jpg' ,'*.png' ,'*.gif' ,'*.pdf' ,'*.pyc' ,'*.exe' ,'*.flv' ,'*.img' ,'*.xlsx' ,'*.zip' ,'*.so' ,'*.swp' ,'*/tmp/*' ,'*/.git/*'}
vim.opt.fillchars = { vert = ' ' }

-- Make shell not source startup scripts when running shell command in vim
vim.opt.shellcmdflag = '-f -c'

-- }}}
-- Keymap: {{{

local function map(m, k, v, sil)
    vim.keymap.set(m, k, v, { noremap = true, silent = sil })
end

map('i', 'jj', '<Esc>', true)
map('n', '<Space>', ':', false)
map('v', '<Space>', ':', false)
map('n', 'gw', '<C-w>', true)
-- map('n', 'gp', ':find<Space>*')

-- Move line up/down
map('n', '<C-j>', ':m .+1<CR>', true)
map('n', '<C-k>', ':m .-2<CR>', true)
map('i', '<C-j>', '<Esc>:m .+1<CR>gi', true)
map('i', '<C-k>', '<Esc>:m .-2<CR>gi', true)
map('v', '<C-j>', ":m '>+1<CR>gv", true)
map('v', '<C-k>', ":m '<-2<CR>gv", true)

-- Go to prev match history in command line
map('c', '<C-j>', '<down>', true)
map('c', '<C-k>', '<up>', true)

-- Keeping search result centered
map('n', 'N', 'Nzzzv', true)
map('n', 'n', 'nzzzv', true)

-- Horizontal movement w/ easier pressing
map('n', 'H', '^', true)
map('n', 'L', '$', true)

-- Replace the word under cursor
map('n', 'gcr', ':%s/\\<<C-r><C-w>\\>//g<left><left>', false)

-- Remap since ; is used for fold toggle
map('n', '<leader>;', ';', true)

-- Toggle fold
map('n', ';', 'za', true)
map('v', ';', 'za', true)

-- Display buffer list and go to buffer
map('n', 'gb', ':ls<CR>:b<Space>', false)
-- Display buffet list and open buffer in right split
map('n', 'gs', ':ls<CR>:vert sb<Space>', false)

-- Go to last buffer
map('n', '<C-h>', ':b#<CR>', true)
-- Move to next split
map('n', '<C-l>', '<C-w>w', true)

-- }}}
-- Autocmd: {{{

vim.api.nvim_create_augroup("cursorline_toggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "VimEnter", "WinEnter" },
    { group = "cursorline_toggle", command = "setlocal cursorline" }
)
vim.api.nvim_create_autocmd(
    { "WinLeave" },
    { group = "cursorline_toggle", command = "setlocal nocursorline" }
)

vim.api.nvim_create_augroup("cursorcolumn_toggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "InsertEnter" },
    { group = "cursorcolumn_toggle", command = "setlocal cursorcolumn" }
)
vim.api.nvim_create_autocmd(
    { "InsertLeave" },
    { group = "cursorcolumn_toggle", command = "setlocal nocursorcolumn" }
)

vim.api.nvim_create_augroup("number_toggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave" },
    { group = "number_toggle", command = "set relativenumber" }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter" },
    { group = "number_toggle", command = "set norelativenumber" }
)

vim.api.nvim_create_augroup("autocomplete_ignore_case", { clear = true })
vim.api.nvim_create_autocmd(
    { "InsertEnter" },
    { group = "autocomplete_ignore_case", command = "set ignorecase" }
)
vim.api.nvim_create_autocmd(
    { "InsertLeave" },
    { group = "autocomplete_ignore_case", command = "set noignorecase" }
)

vim.api.nvim_create_augroup("vertical_center_insert", { clear = true })
vim.api.nvim_create_autocmd(
    { "InsertEnter" },
    { group = "vertical_center_insert", command = "norm zz" }
)

-- Filename suffix for 'gf' to search in path
vim.api.nvim_create_augroup("verilog_suffixadd", { clear = true })
vim.api.nvim_create_autocmd(
    { "InsertEnter" },
    {
        group = "verilog_suffixadd",
        pattern = { "verilog", "systemverilog" },
        command = "setlocal suffixesadd+=.v,.sv,.h,.vh,.svh"
    }
)

-- }}}

