return {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    dependencies = {
        'joosepalviste/nvim-ts-context-commentstring',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
    },

    config = function()
        local treesitter = require('nvim-treesitter.configs')

        vim.keymap.set('n', '<f10>', '<cmd>TSHighlightCapturesUnderCursor<cr>')

        treesitter.setup {
            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            autopairs = {
                enable = true,
            },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ['ab'] = '@block.outer',
                        ['ib'] = '@block.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@conditional.outer',
                        ['ic'] = '@conditional.inner',
                        ['aC'] = '@class.outer',
                        ['iC'] = '@class.inner',
                        ['al'] = '@loop.outer',
                        ['il'] = '@loop.inner',
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@paramter.inner',
                    },
                },
            },
        }

        require('ts_context_commentstring').setup({
          enable_autocmd = false,
        })
    end,
}
