local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local borderchars = {
    results = { '', '', '', '', '', '', '', '' },
    preview = { '', '', '', '', '', '', '', '' },
}

local layout_config = {
    horizontal = {
        prompt_position = 'top',
        -- Make full screen
        width = { padding = 0 },
        height = { padding = 0 },
        preview_width = 0.5,
    },
}

local opt_ivy = {
    theme = 'ivy',
    layout_strategy = 'horizontal',
    layout_config = layout_config,
    borderchars = borderchars,
    results_title = false,
    preview_title = false,
}

local opt_dropdown = function(p)
    return {
        theme = 'dropdown',
        layout_strategy = 'center',
        prompt_prefix = p,
        prompt_title = false,
        results_title = false,
        previewer = false,
    }
end

local telescope_buffer_dir = function()
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
    pickers = {
        git_files = opt_dropdown('Files> '),
        find_files = opt_dropdown('Files> '),
        buffers = opt_dropdown('Buffers> '),
        oldfiles = opt_dropdown('Oldfiles> '),
        quickfix = opt_ivy,
        live_grep = opt_ivy,
        current_buffer_fuzzy_find = opt_ivy,
        git_commits = opt_ivy,
        git_bcommits = opt_ivy,
        git_branches = opt_ivy,
        git_status = opt_ivy,
    },
    extensions = {
        file_browser = {
            theme = 'ivy',
            layout_strategy = 'horizontal',
            layout_config = layout_config,
            borderchars = borderchars,
            results_title = false,
            preview_title = false,
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

_G.TelescopeFiles = function()
    local _, ret, _ = require('telescope.utils').get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
    if ret == 0 then 
        builtin.git_files({ show_untracked = true }) 
    else
        builtin.find_files() -- Recommended: 'sharkdp/fd'
    end 
end

map('n', '<C-p>', ':Telescope ', opt_n)
map('n', 'gpp', '<cmd>lua TelescopeFiles()<CR>', opt_s)
map('n', 'gpb', builtin.buffers, opt_s)
map('n', 'gpo', builtin.oldfiles, opt_s)
map('n', 'gpf', telescope.extensions.file_browser.file_browser, opt_s)
map('n', 'gpq', builtin.quickfix, opt_s)
map('n', 'gpg', builtin.live_grep, opt_s) -- Require: 'BurntShusi/ripgrep'
map('n', 'gps', builtin.current_buffer_fuzzy_find, opt_s)
