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
            snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                end
            },

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
                ['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
                ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),

                ['<cr>'] = cmp.mapping(cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }), {'i', 'c'}),

                ['<tab>'] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        else
                            cmp.select_next_item()
                        end
                    else
                        fallback()
                    end
                end, {'i', 's'}),

                ['<s-tab>'] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        else
                            cmp.select_prev_item()
                        end
                    else
                        fallback()
                    end
                end, {'i', 's'}),
            },
        })

        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),

            sources = {
                { name = 'buffer' },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),

            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                {
                    name = 'cmdline',

                    option = {
                        ignore_cmds = { 'Man', '!' }
                    },
                },
            })
        })
    end,
}
