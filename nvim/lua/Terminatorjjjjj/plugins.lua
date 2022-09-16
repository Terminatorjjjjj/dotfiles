-- local status, packer = pcall(require, "packer")
-- if (not status) then
--   print("Packer is not installed")
--   return
-- end
-- 
-- vim.cmd [[packadd packer.nvim]]

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require('packer').startup({function(use)
    use('wbthomason/packer.nvim')

    -- Utils
    use('tpope/vim-unimpaired')
    use('junegunn/vim-easy-align')
    use('vim-scripts/VisIncr')
    use('luochen1990/rainbow')

    -- Statusline
    use({
        'nvim-lualine/lualine.nvim',
--         event = 'BufEnter',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Colorscheme
--     use('gruvbox-community/gruvbox')
--     use 'arcticicestudio/nord-vim'
    use('sainnhe/everforest')
--     use 'sainnhe/gruvbox-material'

    -- Autocomplete
    use({
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            requires = {
                {
                    'L3MON4D3/LuaSnip',
--                     event = 'InsertCharPre'
                },
                {
                    'rafamadriz/friendly-snippets',
--                     event = 'InsertCharPre'
                }
            }
        },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    })

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
--         event = 'CursorHold',
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
