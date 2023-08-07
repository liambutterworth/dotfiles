return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
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
                { name = 'buffer' },
            }),

            mapping = cmp.mapping.preset.insert({
                ['<c-e>'] = cmp.mapping.abort(),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
                ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
            }),
        })
    end,
}
