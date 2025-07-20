local opt_s = { noremap = true, silent = true }

local function verilog_align_port()
    return ":s/\\(input\\|output\\|inout\\)/\\1###/e<CR>"
        .. ":'<,'>s/\\(logic\\|reg\\|wire\\)/##\\1##/e<CR>"
        .. ":'<,'>s/\\(\\[.\\+:\\w\\+\\]\\)/#\\1#/e<CR>"
        .. ":'<,'>s/##\\s\\+##/ /e<CR>"
        .. ":'<,'>s/#\\s\\+#/ /e<CR>"
        .. ":'<,'>s/ \\ze\\[[^:]*\\(\\]\\)\\+/# /e<CR>"
        .. ":'<,'>EasyAlign * /#/ l0r0<CR>"
        .. ":'<,'>s/#\\+/#/ge<CR>"
        .. ":'<,'>s/#/ /ge<CR>"
        .. ":'<,'>noh<CR>"
end

vim.keymap.set('n', 'gyp', verilog_align_port(), opt_s)
vim.keymap.set('v', 'gyp', verilog_align_port(), opt_s)

local function verilog_auto_instance()
    return ":s/\\(input\\|output\\|inout\\)//e<CR>"
        .. ":'<,'>s/\\(logic\\|reg\\|wire\\)//e<CR>"
        .. ":'<,'>s/\\(\\[.\\+:\\w\\+\\]\\)//e<CR>"
        .. ":'<,'>s/\\s*\\(\\h\\+\\)/\\.\\1\\(\\1\\)/e<CR>"
        .. ":'<,'>s/\\s*\\[[^:]*\\(\\]\\)\\+//e<CR>"
        .. ":'<,'>noh<CR>"
end

vim.keymap.set('n', 'gyy', verilog_auto_instance(), opt_s)
vim.keymap.set('v', 'gyy', verilog_auto_instance(), opt_s)

local function verilog_align_instance()
    return ":EasyAlign /./ l0r0<CR>"
        .. ":'<,'>EasyAlign /(/ l1r1<CR>"
        .. ":'<,'>EasyAlign /\\[/ l1r0<CR>"
        .. ":'<,'>EasyAlign /)/ l1r0<CR>"
        .. ":'<,'>noh<CR>"
end

vim.keymap.set('n', 'gyi', verilog_align_instance(), opt_s)
vim.keymap.set('v', 'gyi', verilog_align_instance(), opt_s)
