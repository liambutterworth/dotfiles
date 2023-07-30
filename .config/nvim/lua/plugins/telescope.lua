return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'kyazdani42/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                prompt_prefix = '❯ ',
                selection_caret = '❯ ',
                sorting_strategy = 'ascending',

                layout_config = {
                    horizontal = {
                        height = 0.95,
                        width = 0.95,
                        preview_width = 0.5,
                    },

                    vertical = {
                        height = 0.95,
                        width = 0.95,
                    },
                },

                borderchars = {
                    '─',
                    '│',
                    '─',
                    '│',
                    '┌',
                    '┐',
                    '┘',
                    '└'
                },

                mappings = {
                    i = {
                        ['<c-f>'] = actions.toggle_selection,
                        ['<c-s>'] = actions.file_split,
                        ['<c-x>'] = false,
                    },

                    n = {
                        ['<c-s>'] = actions.file_split,
                        ['<c-x>'] = false,
                    },
                },
            },


            pickers = {
                buffers = {
                    sort_mru = true,

                    mappings = {
                        i = {
                            ['<c-d>'] = 'delete_buffer',
                        },

                        n = {
                            ['<c-d>'] = 'delete_buffer',
                        },
                    },
                },

                live_grep = {
                    path_display = {
                        shorten = 1,
                    },
                },
            },

            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        })

        telescope.load_extension('file_browser')

        vim.keymap.set('n', '<space><space>', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<space><tab>', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>')
        vim.keymap.set('n', '<space><cr>', '<cmd>Telescope file_browser<cr>')
        vim.keymap.set('n', '<space><bs>', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<space>?', '<cmd>Telescope help_tags<cr>')
        vim.keymap.set('n', "<space>'", '<cmd>Telescope marks<cr>')
        vim.keymap.set('n', '<space>"', '<cmd>Telescope registers<cr>')
        vim.keymap.set('n', '<space>:', '<cmd>Telescope commands<cr>')
        vim.keymap.set('n', '<space>;', '<cmd>Telescope command_history<cr>')
        vim.keymap.set('n', '<space>/', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<space>.', '<cmd>Telescope live_grep search_dirs=%:h<cr>')
        vim.keymap.set('n', '<space>,', '<cmd>Telescope live_grep grep_open_files=true<cr>')
        vim.keymap.set('n', '<space>+', '<cmd>Telescope git_status<cr>')
        vim.keymap.set('n', '<space>=', '<cmd>Telescope git_branches<cr>')
        vim.keymap.set('n', '<space>-', '<cmd>Telescope git_commits<cr>')
        vim.keymap.set('n', '<space>_', '<cmd>Telescope git_bcommits<cr>')
    end,
}
