return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
    },

    config = function()
        local cmp = require('cmp')

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip' },
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }),

            mapping = cmp.mapping.preset.insert({
                ['<c-b>'] = cmp.mapping.scroll_docs(-4),
                ['<c-f>'] = cmp.mapping.scroll_docs(4),
                ['<c-e>'] = cmp.mapping.abort(),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
                ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
            }),

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            }
        })
    end,
}
