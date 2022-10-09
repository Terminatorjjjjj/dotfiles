vim.opt.termguicolors = true

vim.g.rainbow_active = 1
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
-- vim.g.everforest_disable_italic_comment = 1

vim.g.my_statusline_standout_gray_scale = true
vim.g.my_statusline_normal_gray_scale = false
vim.g.my_statusline_icon_gray_scale = false

vim.cmd [[
try
  colorscheme everforest
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd('hi CursorLine ctermbg=16 guibg=#000000')
vim.cmd('hi! link CursorLineNr CursorLine')
vim.cmd('hi! link Folded Comment')
vim.cmd('hi! link CmpItemMenu Comment')

if vim.g.my_statusline_standout_gray_scale then
    vim.cmd('hi MyStatusLineStandout cterm=none ctermfg=237 ctermbg=246 gui=none guifg=#3a3a3a guibg=#949494')
else
    vim.cmd('hi! link MyStatusLineStandout PmenuSel')
end

if vim.g.my_statusline_normal_gray_scale then
    vim.cmd('hi MyStatusLineNormal cterm=none ctermfg=243 ctermbg=235 gui=none guifg=#767676 guibg=#262626')
else
    vim.cmd('hi! link MyStatusLineNormal LineNr')
end

if vim.g.my_statusline_icon_gray_scale then
    vim.cmd('hi! link MyStatusLineIcon MyStatusLineNormal')
else
    vim.cmd('hi! link MyStatusLineIcon Title')
--     vim.cmd('hi! link MyStatusLineIcon WarningMsg')
end
