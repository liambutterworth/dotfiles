return {
    'windwp/nvim-autopairs',

    dependencies = {
        'windwp/nvim-ts-autotag',
    },

    config = function()
        local autopairs = require('nvim-autopairs')
        local autotag = require('nvim-ts-autotag')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        autopairs.setup({
            check_ts = true,
            disable_filetype = { 'TelescopePrompt' },
            disable_in_macro = true,
            map_cr = true,
        })

        autotag.setup({
            opts = {
                enable_close_on_slash = true,
            },

            per_filetype = {
                ['php'] = {
                    enable_close = false,
                    enable_rename = false,
                }
            }
        })

        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        vim.keymap.set('i', '<c-e>,', '<space><esc>m`A,<esc>``s')
        vim.keymap.set('i', '<c-e>;', '<space><esc>m`A;<esc>``s')
        vim.keymap.set('i', '<c-e>/', '<space><esc>m`A /><esc>``s')
    end,
}
