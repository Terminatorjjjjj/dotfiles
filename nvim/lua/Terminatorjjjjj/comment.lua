local function comment(c, p)
    return vim.api.nvim_create_autocmd({ 'FileType' }, {
        group = 'get_comment_leader',
        pattern = p,
        command = "let b:comment_leader = '" .. c .. "'"
    })
end

vim.api.nvim_create_augroup('get_comment_leader', { clear = true })
comment('// ', {'c', 'cpp', 'java', 'scala', 'verilog', 'systemverilog', 'fotran', 'stata'})
comment('# ',  {'sh', 'ruby', 'python', 'make', 'tmux', 'tcsh', 'csh', 'zsh', 'conf'})
comment('% ',  {'tex', 'matlab'})
comment('\" ', {'vim'})
comment('-- ', {'lua'})

local opt_s = { noremap = true, silent = true }
vim.keymap.set('', 'gcc', ":<C-b>silent <C-e>s/^/<C-r>=escape(b:comment_leader,'\\/')<CR>/<CR>:nohlsearch<CR>", opt_s)
vim.keymap.set('', 'gcu', ":<C-b>silent <C-e>s/^\\v<C-r>=escape(b:comment_leader,'\\/')<CR>//e<CR>:nohlsearch<CR>", opt_s)
