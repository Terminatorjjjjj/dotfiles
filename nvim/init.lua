
-- Packer {{{

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-unimpaired'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'arcticicestudio/nord-vim'
    use 'sainnhe/everforest'
    use 'sainnhe/gruvbox-material'

    use 'onsails/lspkind.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    use 'L3MON4D3/LuaSnip'
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

vim.opt.smartindent = true
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

-- Make shell not source startup scripts when running shell command in vim
vim.opt.shellcmdflag = '-f -c'

vim.opt.foldmethod = 'marker'

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

-- Toggle fold
map('n', "'", 'za', true)
map('v', "'", 'za', true)
-- Remap since ' is used for fold toggle
map('n', "<leader>'", "'", true)

-- Display buffer list and go to buffer
map('n', 'gb', ':ls<CR>:b<Space>', false)
-- Display buffer list and open buffer in right split
map('n', 'gs', ':ls<CR>:vert sb<Space>', false)

-- Go to last buffer
map('n', '<C-h>', ':b#<CR>', true)
-- Move to next split
map('n', '<C-l>', '<C-w>w', true)

-- Quit terminal with Esc
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>', true)

-- }}}
-- Autocmd: {{{

vim.api.nvim_create_augroup("cursorline_toggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "VimEnter", "WinEnter", "BufWinEnter" },
    { group = "cursorline_toggle", command = "setlocal cursorline" }
)
vim.api.nvim_create_autocmd(
    { "WinLeave" },
    { group = "cursorline_toggle", command = "setlocal nocursorline" }
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
-- Colorscheme {{{

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1

vim.cmd('colorscheme everforest')
vim.cmd('hi CursorLine ctermbg=16 guibg=#000000')
vim.cmd('hi CursorLineNr ctermbg=16 guibg=#000000')
vim.cmd('hi! link Folded Comment')

-- }}}

-- Lualine {{{

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
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
        {
            'filename',
            path = 1, -- Relative path
            symbols = {
                modified = ' +',
                readonly = ' ‼',
                unnamed = ' ?',
            }
        }
    },
    lualine_x = {'diagnostics'},
    lualine_y = {'diff'},
    lualine_z = {'%3c'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {
            'filename',
            path = 1, -- Relative path
            symbols = {
                modified = ' +',
                readonly = ' ‼',
                unnamed = ' ?',
            }
        }
    },
    lualine_x = {'%3c'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'quickfix' }
}

-- }}}
-- Cmp {{{

local luasnip = require('luasnip')
local lspkind = require('lspkind')
local cmp = require('cmp')

require('luasnip.loaders.from_snipmate').lazy_load() -- look in ~/.config/nvim/snippets

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
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
        fields = {'kind', 'abbr', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,

            before = function(entry, vim_item)
                vim_item.menu = ({
                    luasnip = '[S]',
                    buffer = '[B]',
                    path = '[P]',
                })[entry.source.name]
                return vim_item
            end,
        })
    },
    sources = {
        { name = 'luasnip' },
        {
            name = 'buffer',
            -- Use all buffers for completion
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
        { name = 'path' },
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- }}}

