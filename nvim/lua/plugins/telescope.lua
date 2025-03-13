local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local theme = function(p)
    return require('telescope.themes').get_dropdown({
        prompt_prefix = p,
        prompt_title = '',
        results_title = '',
        previewer = false,
    })
end

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

telescope.setup {
    defaults = {
        path_display = { 'smart' },

        mappings = {
            i = {
                ['<C-c>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,
                ['<C-/>'] = actions.which_key, -- Show telescope keymaps
            },
            n = {
                ['q'] = actions.close,
                ['?'] = actions.which_key, -- Show telescope keymaps
            },
        },
    },
    extensions = {
        file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            initial_mode = 'normal',
        },
    }
}

telescope.load_extension('file_browser')

-- Keymaps
local map = vim.keymap.set
local opt_n = { noremap = true }
local opt_s = { noremap = true, silent = true }

map('n', '<C-p>', ':Telescope ', opt_n)

_G.TelescopeFiles = function()
    local _, ret, _ = require('telescope.utils').get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
    if ret == 0 then 
        builtin.git_files(theme('Files>'), { show_untracked = true }) 
    else
        builtin.find_files(theme('Files>')) -- Recommended: 'sharkdp/fd'
    end 
end 
map('n', 'gpp', '<cmd>lua TelescopeFiles()<CR>', opt_s)

map('n', 'gpb', function()
    builtin.buffers(theme('Buffers>'))
end, opt_s)
map('n', 'gpo', function()
    builtin.oldfiles(theme('Oldfiles>'))
end, opt_s)

map('n', 'gpf', function()
    telescope.extensions.file_browser.file_browser({
        theme = 'ivy',
        path = '%:p:h',
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
--         previewer = false,
        initial_mode = 'normal',
--         layout_config = { height = 25 },
    })
end, opt_s)

map('n', 'gpq', builtin.quickfix, opt_s)
map('n', 'gpr', builtin.live_grep, opt_s) -- Require: 'BurntShusi/ripgrep'
map('n', 'gps', builtin.current_buffer_fuzzy_find, opt_s)
