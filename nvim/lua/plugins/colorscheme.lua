vim.g.rainbow_active = 1
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
-- vim.g.everforest_disable_italic_comment = 1
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_disable_italic_comment = 1

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

-- Fixed gray scale:
vim.cmd('hi MyStatusLineStandout cterm=none ctermfg=237 ctermbg=246 guifg=#3a3a3a guibg=#949494')
-- vim.cmd('hi MyStatusLineNormal cterm=none ctermfg=243 ctermbg=235 guifg=#767676 guibg=#262626')
-- Dynamic colorscheme dependent:
-- vim.cmd('hi! link MyStatusLineStandout PmenuSel')
vim.cmd('hi! link MyStatusLineNormal LineNr')
