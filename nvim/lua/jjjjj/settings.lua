vim.opt.autochdir = true
vim.opt.expandtab = true
vim.opt.softtabstop = -1 -- If negative, shiftwidth is used
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.pumheight = 10
vim.opt.wildignore = {'*.docx' ,'*.jpg' ,'*.png' ,'*.gif' ,'*.pdf' ,'*.pyc' ,'*.exe' ,'*.flv' ,'*.img' ,'*.xlsx' ,'*.zip' ,'*.so' ,'*.swp' ,'*/tmp/*' ,'*/.git/*'}
vim.opt.fillchars = { vert = ' ' }
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.foldmethod = 'marker'

-- Make shell not source startup scripts when running shell command in vim
vim.opt.shellcmdflag = '-f -c'

-- Reference: https://jdhao.github.io/2019/08/16/nvim_config_folding/
function _G.FoldText()
    local pat = '^ \\+\\|/\\*\\|\\*/\\|-\\+\\|{\\+d\\='
    local line = vim.fn.getline(vim.v.foldstart)
    local trim = vim.fn.substitute(line, pat, '', 'g')
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return vim.fn.printf('··· %4d %s ', line_count, trim)
end

vim.opt.foldtext = 'v:lua.FoldText()'

vim.opt.termguicolors = true

-- Disable some builtin vim plugins
local builtin_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

for _, plugin in pairs(builtin_plugins) do
  vim.g['loaded_' .. plugin] = 1
end

