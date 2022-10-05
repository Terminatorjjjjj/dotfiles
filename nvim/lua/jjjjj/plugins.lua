local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

local status, packer = pcall(require, "packer")
if (not status) then
  vim.notify("Packer is not installed!")
  return
end

return packer.startup({function(use)
    use('wbthomason/packer.nvim')

    -- Utils
    use('kyazdani42/nvim-web-devicons')
--     use('tpope/vim-unimpaired')
    use('junegunn/vim-easy-align')
    use('vim-scripts/VisIncr')
    use('luochen1990/rainbow')
    use('Terminatorjjjjj/vim.sv')

    -- Statusline
--     use('nvim-lualine/lualine.nvim')

    -- Colorscheme
    use('gruvbox-community/gruvbox')
    use('sainnhe/everforest')
--     use('sainnhe/gruvbox-material')
--     use('arcticicestudio/nord-vim')
--     use('navarasu/onedark.nvim')

    -- Autocomplete
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
--             requires = { 'rafamadriz/friendly-snippets' },
        }
    })
    use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })
    use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use('nvim-telescope/telescope-file-browser.nvim')
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    },
    package_root = vim.fn.stdpath('config') .. '/site/pack'
}})
