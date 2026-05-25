return {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',
    branch = 'main',
    lazy = false,

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'joosepalviste/nvim-ts-context-commentstring',
        'rrethy/nvim-treesitter-endwise',
    },

    config = function ()
        local textobjects = require('nvim-treesitter-textobjects')
        local commentstring = require('ts_context_commentstring')

        textobjects.setup({
            select = {
                lookahead = true,
            },
        })

        commentstring.setup()

        vim.keymap.set({ 'x', 'o' }, 'if', function()
            require('nvim-treesitter-textobjects.select')
                .select_textobject('@function.inner', 'textobjects')
        end)

        vim.keymap.set({ 'x', 'o' }, 'af', function()
            require('nvim-treesitter-textobjects.select')
                .select_textobject('@function.outer', 'textobjects')
        end)

        vim.keymap.set({ 'x', 'o' }, 'ic', function()
            require('nvim-treesitter-textobjects.select')
                .select_textobject('@class.inner', 'textobjects')
        end)

        vim.keymap.set({ 'x', 'o' }, 'ac', function()
            require('nvim-treesitter-textobjects.select')
                .select_textobject('@class.outer', 'textobjects')
        end)

        vim.filetype.add({
            pattern = {
                ['.env.*'] = 'bash',
                ['*.ghostty'] = 'dosini',
            },
        })
    end,
}
