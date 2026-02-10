return {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',
    branch = 'main',
    lazy = false,

    dependencies = {
        'joosepalviste/nvim-ts-context-commentstring',
        'rrethy/nvim-treesitter-endwise',
    },

    config = function ()
        local treesitter = require('nvim-treesitter')
        local ts_context_commentstring = require('ts_context_commentstring')

        local filetypes = {
            'php',
            'lua',
            'javascript',
            'vue',
            'html',
            'css',
        }

        treesitter.install(filetypes)
        ts_context_commentstring.setup()

        vim.g.no_plugin_maps = true

        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,

            callback = function()
                vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                vim.treesitter.start()
            end,
        })
    end,
}
