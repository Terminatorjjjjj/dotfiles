-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- Packages are downloaded to ~/.local/share/nvim/lazy/
require("lazy").setup({
    -- Colorscheme
    { "gruvbox-community/gruvbox" },
    { "sainnhe/everforest" },
    { "neanias/everforest-nvim" },
    { "arcticicestudio/nord-vim" },
    { "navarasu/onedark.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "Mofiqul/dracula.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { "folke/tokyonight.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "craftzdog/solarized-osaka.nvim" },
    { "AlexvZyl/nordic.nvim" },

    -- Utils
    { "kyazdani42/nvim-web-devicons", event = "VeryLazy"},
    { "junegunn/vim-easy-align" },
    { "vim-scripts/VisIncr" },
    { "luochen1990/rainbow" },
    { "Terminatorjjjjj/vim.sv", ft = {"verilog", "systemverilog"} },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        config = function()
            return require("plugins.cmp")
        end,
        event = {"InsertEnter", "CmdlineEnter"},
    },
    { "hrsh7th/cmp-buffer", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-path", dependencies = "nvim-cmp" },
    { "hrsh7th/cmp-cmdline", dependencies = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", dependencies = "nvim-cmp" },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Not lazyload w/ cmd since want to replace netrw when starting nvim w/ dir
    { "nvim-telescope/telescope-file-browser.nvim" },
})
