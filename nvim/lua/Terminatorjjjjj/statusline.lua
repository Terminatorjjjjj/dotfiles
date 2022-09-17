local function column() 
       local vc = vim.fn.virtcol('.')
    local line_width = string.len(vim.fn.line('$'))
    local ruler_width = math.max(line_width, 3) -- 3 = numberwidth-1
    local column_witdh = string.len(vc)
    local padding = ruler_width - column_witdh

    if padding <= 0 then
        local padding_width = 0
    else
        local padding_width = padding + 1
    end

    return string.rep(' ', padding) .. vc .. ' '
end

local function filename()
    if vim.bo.filetype == 'help' then
        return ' ' .. string.upper(vim.fn.fnamemodify(vim.fn.expand('%'), ':t:r'))
    elseif vim.bo.filetype == 'qf' then
        return ' QUICKFIX'
    else 
        return ' %<%f'
    end
end

local function readonly()
    if vim.bo.readonly and (not vim.bo.filetype == 'help') then
        return ' ‼' 
    else
        return ''
    end
end

local function modified()
    if vim.bo.modified then
        return ' +' 
    else
        return ''
    end
end

local function branch()
    local br = vim.fn.trim(vim.fn.system("git -C " .. vim.fn.expand("%:h") .. " branch --show-current 2>/dev/null"))
    
    if string.len(br) > 0 then
        return string.upper(br) .. ' '
    else
        return ''
    end
end

Statusline = {}

Statusline.active = function()
    return table.concat {
        '%#PmenuSel#',
        column(),
        '%#StatusLineNC#',
        filename(),
        readonly(),
        modified(),
        '%=',
        branch(),
    }
end

function Statusline.inactive()
    return " %<%F"
end

local aug_sta = vim.api.nvim_create_augroup('statusline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter', 'BufEnter' }, {
    group = aug_sta,
    command = 'setlocal statusline=%!v:lua.Statusline.active()',
})
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    group = aug_sta,
    command = 'setlocal statusline=%!v:lua.Statusline.inactive()',
})
