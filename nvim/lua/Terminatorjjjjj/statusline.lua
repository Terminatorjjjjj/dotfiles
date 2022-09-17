local fn = vim.fn
local api = vim.api

local function column() 
    local vc = fn.virtcol('.')
    local ruler_width = math.max(string.len(fn.line('$')), 3) -- 3 = numberwidth-1
    local column_witdh = string.len(vc)
    local padding = ruler_width - column_witdh
 
    return string.rep(' ', padding) .. vc .. ' '
end
 
local function filename(ft)
    if ft == 'help' then
        return ' ' .. string.upper(fn.fnamemodify(fn.expand('%'), ':t:r'))
    elseif ft == 'qf' then
        return ' QUICKFIX'
    else 
        return ' %<%f'
    end
end

local function readonly(ft, ro)
    return (ft ~= 'help' and ro) and ' ‼' or ''
end

local function modified(mo)
    return mo and ' +' or ''
end

local function branch()
    local br = fn.trim(fn.system("git -C " .. fn.expand("%:h") .. " branch --show-current 2>/dev/null"))
    
    if string.len(br) > 0 then
        return string.upper(br) .. ' '
    else
        return ''
    end
end

Statusline = {}

Statusline.active = function()
    local bufnum = fn.winbufnr(vim.g.statusline_winid)
    local ft = api.nvim_buf_get_option(bufnum, 'filetype')
    local ro = api.nvim_buf_get_option(bufnum, 'readonly')
    local mo = api.nvim_buf_get_option(bufnum, 'modified')

    return table.concat {
        '%#PmenuSel#',
        column(),
        '%#StatusLineNC#',
        filename(ft),
        readonly(ft, ro),
        modified(wo),
        '%=',
        branch(),
    }
end

Statusline.inactive = function()
    return ' %<%F'
end

local aug_sta = api.nvim_create_augroup('statusline', { clear = true })
api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter', 'BufEnter' }, {
    group = aug_sta,
    command = 'setlocal statusline=%!v:lua.Statusline.active()',
})
api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    group = aug_sta,
    command = 'setlocal statusline=%!v:lua.Statusline.inactive()',
})
