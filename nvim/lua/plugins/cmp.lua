local status, cmp = pcall(require, 'cmp')
if (not status) then return end

require('luasnip.loaders.from_snipmate').lazy_load() -- look in ~/.config/nvim/snippets
require('luasnip.loaders.from_vscode').lazy_load() -- load from 'rafamadriz/friendly-snippets'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    completion = { keyword_length = 2 },
    mapping = {
        ['<C-k>'] = cmp.config.disable, -- disable for cmap prev match in history
        ['<C-j>'] = cmp.config.disable,
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
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
            elseif has_words_before() then
                cmp.complete()
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
        fields = {'abbr', 'menu'},
        format = function(entry, vim_item)
            vim_item.kind = ''
            vim_item.menu = ({
                luasnip = '(Snippet)',
                buffer = '(Buffer)',
                path = '(Path)',
                cmdline = '(Cmdline)',
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'luasnip' },
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
        { name = 'path' },
    },
    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor'
        }
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

cmp.setup.cmdline(':', {
    completion = { keyword_length = 3 },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'buffer' },
    }
})
