
-- Packer: {{{

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    -- Utils
    use 'tpope/vim-unimpaired'
    use 'junegunn/vim-easy-align'
    use 'vim-scripts/VisIncr'
    use 'luochen1990/rainbow'

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Colorscheme
--     use 'arcticicestudio/nord-vim'
    use 'sainnhe/everforest'
--     use 'sainnhe/gruvbox-material'

    -- Autocomplete
--     use 'onsails/lspkind.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
--     use 'rafamadriz/friendly-snippets'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    },
    package_root = vim.fn.stdpath('config') .. '/site/pack'
}})

-- }}}

-- Setting: {{{

vim.opt.expandtab = true
vim.opt.softtabstop = -1 -- If negative, shiftwidth is used
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.pumheight = 10
vim.opt.wildignore = {'*.docx' ,'*.jpg' ,'*.png' ,'*.gif' ,'*.pdf' ,'*.pyc' ,'*.exe' ,'*.flv' ,'*.img' ,'*.xlsx' ,'*.zip' ,'*.so' ,'*.swp' ,'*/tmp/*' ,'*/.git/*'}
vim.opt.fillchars = { vert = ' ' }
vim.opt.termguicolors = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.foldmethod = 'marker'

-- Make shell not source startup scripts when running shell command in vim
vim.opt.shellcmdflag = '-f -c'

-- }}}
-- Keymap: {{{
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

-- Horizontal movement w/ easier pressing
map('n', 'H', '^', opt_s)
map('n', 'L', '$', opt_s)

-- Greatest remap accroding to ThePrimagen
map('v', 's', '"_dP', opt_n)

-- Keeping search result centered
map('n', 'N', 'Nzzzv', opt_s)
map('n', 'n', 'nzzzv', opt_s)

-- Move line up/down only in visual mode
map('v', 'J', ":m '>+1<CR>gv", opt_s)
map('v', 'K', ":m '<-2<CR>gv", opt_s)

-- Toggle fold
map('n', "'", 'za', opt_s)
map('v', "'", 'za', opt_s)

-- Go to prev match history in command line
-- Need to disable c-j/c-k in cmp
map('c', '<C-j>', '<Down>', opt_n)
map('c', '<C-k>', '<Up>', opt_n)

-- Quit terminal with Esc
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>', opt_s)

-- }}}
-- Autocmd: {{{

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
autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, grp_rnu, '*', 'set relativernumber')
autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' },   grp_rnu, '*', 'set norelativernumber')

local aug_zz = augroup('vertical_center_insert')
autocmd({ 'InsertEnter' }, aug_zz, '*', 'norm zz')

local aug_sua = augroup('suffixadd_for_gf')
autocmd({ 'InsertEnter' }, aug_sua, { 'verilog', 'systemverilog' }, 'setlocal suffixesadd+=.v,.sv,.h,.vh,.svh')

-- }}}

-- Colorscheme: {{{

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1

vim.cmd('colorscheme everforest')
vim.cmd('hi CursorLine ctermbg=16 guibg=#000000')
vim.cmd('hi! link CursorLineNr CursorLine')
vim.cmd('hi! link Folded Comment')

-- }}}
-- Comment: {{{

local function comment(c, p)
    return vim.api.nvim_create_autocmd({ 'FileType' }, {
        group = 'get_comment_leader',
        pattern = p,
        command = "let b:comment_leader = '" .. c .. "'"
    })
end

augroup('get_comment_leader')
comment('// ', {'c', 'cpp', 'java', 'scala', 'verilog', 'systemverilog', 'fotran', 'stata'})
comment('# ',  {'sh', 'ruby', 'python', 'make', 'tmux', 'tcsh', 'csh', 'zsh', 'conf'})
comment('% ',  {'tex', 'matlab'})
comment('\" ', {'vim'})
comment('-- ', {'lua'})

map('', 'gcc', ":<C-b>silent <C-e>s/^/<C-r>=escape(b:comment_leader,'\\/')<CR>/<CR>:nohlsearch<CR>", opt_s)
map('', 'gcu', ":<C-b>silent <C-e>s/^\\v<C-r>=escape(b:comment_leader,'\\/')<CR>//e<CR>:nohlsearch<CR>", opt_s)

-- }}}
-- Foldtext: {{{

-- Reference: https://jdhao.github.io/2019/08/16/nvim_config_folding/
function _G.FoldText()
    local pat = '^ \\+\\|/\\*\\|\\*/\\|-\\+\\|{\\+d\\='
    local line = vim.fn.getline(vim.v.foldstart)
    local trim = vim.fn.substitute(line, pat, '', 'g')
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return vim.fn.printf('··· %4d %s ', line_count, trim)
end

vim.opt.foldtext = 'v:lua.FoldText()'

-- }}}

-- Easy Align: {{{

-- Start interactive EasyAlign in visual mode (e.g. vipga)
map('x', 'ga', '<Plug>(EasyAlign)', opt_s)
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
map('n', 'ga', '<Plug>(EasyAlign)', opt_s)

-- Verilog non-blocking auto align
map('i', '<=', '<=<Esc>mzvip:EasyAlign/<=/<CR>`z$a<Space>', opt_s)

-- Customized setting mainly for verilog
-- d: for aligning port/signal list with last space before ,;=)
vim.cmd([[
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
    \     'left_margin':   0,
    \     'right_margin':  0,
    \ },
    \ 'd': {
    \     'pattern':      ' \ze\S\+\s*[,;=]',
    \     'left_margin':  0,
    \     'right_margin': 0
    \ }}
]])

-- }}}
-- Rainbow: {{{

vim.g.rainbow_active = 1

-- }}}
-- Lualine: {{{

local status_symbol = {
    modified = ' +',
    readonly = ' ‼',
    unnamed = ' ?',
}

require('lualine').setup {
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

-- }}}
-- Cmp: {{{

local luasnip = require('luasnip')
local cmp = require('cmp')

require('luasnip.loaders.from_snipmate').lazy_load() -- look in ~/.config/nvim/snippets

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { keyword_length = 2 },
    mapping = {
        ['<C-k>'] = cmp.config.disable, -- disable for cmap prev match in history
        ['<C-j>'] = cmp.config.disable,
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end,
        { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        { 'i', 's' }
        ),
    },
    formatting = {
        fields = {'abbr', 'menu'},
        format = function(entry, vim_item)
            vim_item.kind = ''
            vim_item.menu = ({
                luasnip = '(Snippet)',
                buffer = '(Buffer)',
                path = '(Path)',
                cmdline = '(Cmdline)',
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'luasnip' },
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                    if byte_size > 1024 * 1024 then -- 1MByte max
                        return {}
                    end
                    return { buf }
                end
            }
        },
        { name = 'path' },
    },
    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor'
        }
    },
    window = { documentation = cmp.config.window.bordered() },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

cmp.setup.cmdline(':', {
    completion = { keyword_length = 3 },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'buffer' },
    }
})

vim.cmd([[hi! link CmpItemMenu Comment]])

-- }}}
-- Telescope: {{{

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local theme = function(p)
    return require('telescope.themes').get_dropdown({
        winblend = 10,
        prompt_prefix = p,
        prompt_title = '',
        results_title = '',
        previewer = false,
    })
end

require('telescope').setup {
    defaults = {
        winblend = 10,
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
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<C-/>'] = actions.which_key, -- Show telescope keymaps
            },
            n = {
                ['<Esc>'] = actions.close,
                ['?'] = actions.which_key, -- Show telescope keymaps
            },
        },
    },
}

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

map('n', 'gpq', builtin.quickfix, opt_s)
map('n', 'gpf', builtin.current_buffer_fuzzy_find, opt_s)
map('n', 'gpg', builtin.live_grep, opt_s) -- Require: 'BurntShusi/ripgrep'
map('n', 'gpc', builtin.grep_string, opt_s) -- Require: 'BurntShusi/ripgrep'
-- }}}

-- modeline
-- vim:foldmethod=marker:foldmarker={{{,}}}:foldlevel=0:
