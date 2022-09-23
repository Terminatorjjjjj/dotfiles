local function augroup(g)
    return vim.api.nvim_create_augroup(g, { clear = true })
end
local function autocmd(e, g, p, c)
    return vim.api.nvim_create_autocmd(e, { group = g, pattern = p, command = c })
end

local aug_cul = augroup('cursorline_toggle')
autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, grp_cul, '*', 'setlocal cursorline')
autocmd({ 'WinLeave' },                            grp_cul, '*', 'setlocal nocursorline')
autocmd({ 'FileType' },                            grp_cul, 'TelescopePrompt', 'setlocal nocursorline')

local aug_rnu = augroup('rnumber_toggle')
autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, grp_rnu, '*', 'set relativenumber')
autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' },   grp_rnu, '*', 'set norelativenumber')

local aug_zz = augroup('vertical_center_insert')
autocmd({ 'InsertEnter' }, aug_zz, '*', 'norm zz')

local aug_sua = augroup('suffixadd_for_gf')
autocmd({ 'InsertEnter' }, aug_sua, { 'verilog', 'systemverilog' }, 'setlocal suffixesadd+=.v,.sv,.h,.vh,.svh')
