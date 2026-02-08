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
                ['<c-h>'] = cmp.mapping.abort(),
                ['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
                ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
                ['<cr>'] = cmp.mapping(cmp.mapping.confirm()),
                ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
                ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item()),
            },
        })
    end,
}
