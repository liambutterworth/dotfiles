return {
    'windwp/nvim-autopairs',

    dependencies = {
        'windwp/nvim-ts-autotag',
    },

    config = function()
        local autopairs = require('nvim-autopairs')
        local autotag = require('nvim-ts-autotag')

        autopairs.setup({
            check_ts = true,
            disable_filetype = { 'TelescopePrompt' },
        })

        autotag.setup({
            opts = {
                enable_close_on_slash = true
            }
        })
    end,
}
