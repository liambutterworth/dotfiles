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
        require('nvim-treesitter').install({
            'bash', 'lua', 'php', 'sql', 'css', 'html', 'javascript', 'vue',
        })

        require('ts_context_commentstring').setup()

        vim.filetype.add({
            pattern = {
                ['.env.*'] = 'bash',
            },
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'sql', 'lua', 'php', 'html', 'css', 'javascript', 'vue' },

            callback = function()
                vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                vim.treesitter.start()
            end,
        })
    end,
}
