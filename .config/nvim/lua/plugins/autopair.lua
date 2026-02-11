return {
    'windwp/nvim-autopairs',

    dependencies = {
        'windwp/nvim-ts-autotag',
    },

    config = function()
        require('nvim-autopairs').setup({
            check_ts = true,
            disable_filetype = { 'TelescopePrompt' },
            disable_in_macro = true,
            map_cr = true,
        })

        require('nvim-ts-autotag').setup({
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

        vim.keymap.set('i', '<c-e>,', '<space><esc>m`A,<esc>``s')
        vim.keymap.set('i', '<c-e>;', '<space><esc>m`A;<esc>``s')
    end,
}
