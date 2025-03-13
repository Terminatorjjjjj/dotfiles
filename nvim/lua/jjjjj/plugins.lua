-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.config/nvim/site/pack/packer/start/packer.nvim

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

local status, packer = pcall(require, 'packer')
if (not status) then
  vim.notify('Packer is not installed!')
  return
end

return packer.startup({function(use)
    use('wbthomason/packer.nvim')

    -- Utils
    use('kyazdani42/nvim-web-devicons')
    use('junegunn/vim-easy-align')
    use('vim-scripts/VisIncr')
    use('luochen1990/rainbow')
    use('Terminatorjjjjj/vim.sv')

    -- Colorscheme
    use('gruvbox-community/gruvbox')
    use('sainnhe/everforest')
    use('arcticicestudio/nord-vim')
    use('navarasu/onedark.nvim')
    use('EdenEast/nightfox.nvim')
    use('Mofiqul/dracula.nvim')
    use('folke/tokyonight.nvim')
    use('rebelot/kanagawa.nvim')
    use('craftzdog/solarized-osaka.nvim')
    use('AlexvZyl/nordic.nvim')

    -- Autocomplete
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            requires = { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            return require('plugins.cmp')
        end,
        event = {'InsertEnter', 'CmdlineEnter'},
    })
    use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })
    use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })

    -- Fuzzy finder
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' },
    })
    -- Not lazyload w/ cmd since want to replace netrw when starting nvim w/ dir
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
