return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
    },

    config = function()
        local cmp = require('cmp')

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'path' },
                { name = 'calc' },
            }, {
                { name = 'buffer' },
            }),

            mapping = {
                ['<cr>'] = cmp.mapping(cmp.mapping.confirm()),
                ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
                ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                ['<c-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
                ['<c-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
                ['<c-h>'] = cmp.mapping.abort(),
            },

            window = {
                completion = cmp.config.window.bordered({ border = 'single' }),
                documentation = cmp.config.window.bordered({ border = 'single' }),
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),

            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            })
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),

            sources = {
                { name = 'buffer' },
            }
        })
    end,
}
