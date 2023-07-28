return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-vsnip',
    },

    config = function()
        local cmp = require('cmp')
        local context = require('cmp.config.context')

        vim.api.nvim_set_keymap('n', '[k', '<cmd>lua require("cmp").setup { enabled = false }<cr>', {})
        vim.api.nvim_set_keymap('n', ']k', '<cmd>lua require("cmp").setup { enabled = true }<cr>', {})

        cmp.setup({
            sources = {
                { name = 'buffer' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'path' },
                { name = 'vsnip' },
            },

            snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                end,
            },

            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-n>'] = cmp.mapping.scroll_docs(-4),
                ['<C-p>'] = cmp.mapping.scroll_docs(4),
                ['<C-h>'] = cmp.mapping.close(),
                ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            },

            enabled = function()
                if context.in_treesitter_capture('comment') == true or context.in_syntax_group('Comment') then
                    return false
                else
                    return true
                end
            end
        })
    end,
}
