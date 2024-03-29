local status, lualine = pcall(require, 'lualine')
if (not status) then return end
  
vim.opt.showmode = false

local status_symbol = {
    modified = '+ ',
    readonly = '‼ ',
    unnamed = '? ',
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {{
            'filename',
            symbols = status_symbol
        }},
        lualine_x = { 'diagnostics' },
        lualine_y = { 'diff' },
        lualine_z = { '%3c' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            symbols = status_symbol
        }},
        lualine_x = { '%3c' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'quickfix' }
}
