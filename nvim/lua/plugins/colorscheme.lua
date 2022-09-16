vim.g.rainbow_active = 1
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1

vim.cmd([[
try
  colorscheme everforest
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

vim.cmd('hi CursorLine ctermbg=16 guibg=#000000')
vim.cmd('hi! link CursorLineNr CursorLine')
vim.cmd('hi! link Folded Comment')
vim.cmd('hi! link CmpItemMenu Comment')
