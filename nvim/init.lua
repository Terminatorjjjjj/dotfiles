
-- Packer {{{

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-unimpaired'
    use 'junegunn/vim-easy-align'

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
--     use 'rafamadriz/friendly-snippets'
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

-- Make shell not source startup scripts when running shell command in vim
vim.opt.shellcmdflag = '-f -c'

vim.opt.foldmethod = 'marker'

-- }}}
-- Keymap: {{{

local map = vim.keymap.set
local opt_n = { noremap = true }
local opt_s = { noremap = true, silent = true }

map('n', '<Space>', ':', opt_n)
map('v', '<Space>', ':', opt_n)
map('i', 'jj', '<Esc>', opt_s)
map('n', 'gw', '<C-w>', opt_s)
-- map('n', 'gp', ':find<Space>*', opt_n)

-- Move line up/down
map('n', '<C-j>', ':m .+1<CR>', opt_s)
map('n', '<C-k>', ':m .-2<CR>', opt_s)
map('i', '<C-j>', '<Esc>:m .+1<CR>gi', opt_s)
map('i', '<C-k>', '<Esc>:m .-2<CR>gi', opt_s)
map('v', '<C-j>', ":m '>+1<CR>gv", opt_s)
map('v', '<C-k>', ":m '<-2<CR>gv", opt_s)

-- TODO don't seem to work when cmp-cmdline is on
-- Go to prev match history in command line
map('c', '<C-j>', '<Down>', opt_n)
map('c', '<C-k>', '<Up>', opt_n)

-- Keeping search result centered
map('n', 'N', 'Nzzzv', opt_s)
map('n', 'n', 'nzzzv', opt_s)

-- Horizontal movement w/ easier pressing
map('n', 'H', '^', opt_s)
map('n', 'L', '$', opt_s)

-- Replace the word under cursor
map('n', 'gcr', ':%s/\\<<C-r><C-w>\\>//g<left><left>', opt_n)

-- Toggle fold
map('n', "'", 'za', opt_s)
map('v', "'", 'za', opt_s)
-- Remap since ' is used for fold toggle
map('n', "<leader>'", "'", opt_s)

-- Display buffer list and go to buffer
map('n', 'gb', ':ls<CR>:b<Space>', opt_n)
-- Display buffer list and open buffer in right split
map('n', 'gs', ':ls<CR>:vert sb<Space>', opt_n)

-- Go to last buffer
map('n', '<C-h>', ':b#<CR>', opt_s)
-- Move to next split
map('n', '<C-l>', '<C-w>w', opt_s)

-- Quit terminal with Esc
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>', opt_s)

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
-- Comment {{{

vim.api.nvim_create_augroup("get_comment_leader", { clear = true })
vim.api.nvim_create_autocmd(
   { "FileType" },
   {
       group = "get_comment_leader",
       pattern = { "c", "cpp", "java", "scala", "verilog", "systemverilog", "fotran", "stata" },
       command = "let b:comment_leader = '// '"
   }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        group = "get_comment_leader",
        pattern = { "sh", "ruby", "python", "make", "tmux", "tcsh", "csh", "zsh", "conf" },
        command = "let b:comment_leader = '# '"
    }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        group = "get_comment_leader",
        pattern = { "tex", "matlab" },
        command = "let b:comment_leader = '% '"
    }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        group = "get_comment_leader",
        pattern = { "vim" },
        command = "let b:comment_leader = '\" '"
    }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        group = "get_comment_leader",
        pattern = { "lua" },
        command = "let b:comment_leader = '-- '"
    }
)

map('', 'gcc', ":<C-b>silent <C-e>s/^/<C-r>=escape(b:comment_leader,'\\/')<CR>/<CR>:nohlsearch<CR>", opt_s)
map('', 'gcu', ":<C-b>silent <C-e>s/^\\v<C-r>=escape(b:comment_leader,'\\/')<CR>//e<CR>:nohlsearch<CR>", opt_s)

-- }}}

-- Easy Align {{{

-- Start interactive EasyAlign in visual mode (e.g. vipga)
map('x', 'ga', '<Plug>(EasyAlign)')
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
map('n', 'ga', '<Plug>(EasyAlign)')

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
    \     },
    \ ':': {
    \     'pattern':       ':',
    \     'left_margin':   1,
    \     'right_margin':  1,
    \     },
    \ '?': {
    \     'pattern':       '?',
    \     'left_margin':   1,
    \     'right_margin':  1,
    \     },
    \ '(': {
    \     'pattern':       '(',
    \     'left_margin':   1,
    \     'right_margin':  0,
    \   },
    \ ')': {
    \     'pattern':       ')',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \   },
    \ 'd': {
    \     'pattern':      ' \ze\S\+\s*[,;=]',
    \     'left_margin':  0,
    \     'right_margin': 0
    \   }
    \ }
]])

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

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
    snippet = {
        expand = function(args)
            local luasnip = prequire('luasnip')
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
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
            elseif check_backspace() then
                fallback()
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
        fields = {'menu', 'abbr'},
        format = function(entry, vim_item)
            vim_item.kind = ''
            vim_item.menu = ({
                luasnip = '', -- [S]
                buffer = '', -- [B]
                path = '', -- [P]
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'luasnip', keyword_length = 2 },
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
        { name = 'path', keyword_length = 2 },
    },
    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor'
        }
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- }}}

-- modeline
-- vim:foldmethod=marker:foldmarker={{{,}}}:foldlevel=0:
