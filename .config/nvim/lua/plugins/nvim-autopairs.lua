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
        })

        autotag.setup()

        autopairs.add_rules(
            require('nvim-autopairs.rules.endwise-lua')
        )
    end,
}
