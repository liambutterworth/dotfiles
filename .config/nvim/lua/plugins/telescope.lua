return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
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
        })

        vim.keymap.set('n', '<cr><cr>', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<cr><bs>', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<cr><tab>', '<cmd>Telescope jumplist<cr>')
        vim.keymap.set('n', '<cr>.', '<cmd>Telescope find_files cwd=%:h<cr>')
        vim.keymap.set('n', '<cr>[', '<cmd>Telescope tagstack<cr>')
        vim.keymap.set('n', '<cr>]', '<cmd>Telescope tags<cr>')
        vim.keymap.set('n', '<cr>}', '<cmd>Telescope buffer_tags<cr>')
        vim.keymap.set('n', '<cr>r', '<cmd>Telescope command_history<cr>')
        vim.keymap.set('n', "<cr>'", '<cmd>Telescope marks<cr>')
        vim.keymap.set('n', '<cr>"', '<cmd>Telescope registers<cr>')
        vim.keymap.set('n', '<cr>j', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<cr>k', '<cmd>Telescope live_grep search_dirs=%:h<cr>')
        vim.keymap.set('n', '<cr>l', '<cmd>Telescope live_grep grep_open_files=true<cr>')
        vim.keymap.set('n', '<cr>/', '<cmd>Telescope search_history<cr>')
        vim.keymap.set('n', '<cr>?', '<cmd>Telescope help_tags<cr>')
        vim.keymap.set('n', '<cr>c', '<cmd>Telescope commands<cr>')
        vim.keymap.set('n', '<cr>gf', '<cmd>Telescope git_files<cr>')
        vim.keymap.set('n', '<cr>gs', '<cmd>Telescope git_status<cr>')
        vim.keymap.set('n', '<cr>gl', '<cmd>Telescope git_commits<cr>')
        vim.keymap.set('n', '<cr>gc', '<cmd>Telescope git_bcommits<cr>')
        vim.keymap.set('n', '<cr>gb', '<cmd>Telescope git_branches<cr>')
        vim.keymap.set('n', '<cr>gt', '<cmd>Telescope git_stash<cr>')
        vim.keymap.set('n', '<cr>la', '<cmd>Telescope lsp_code_actions<cr>')
        vim.keymap.set('n', '<cr>ld', '<cmd>Telescope lsp_document_diagnostics<cr>')
        vim.keymap.set('n', '<cr>li', '<cmd>Telescope lsp_implementations<cr>')
        vim.keymap.set('n', '<cr>lk', '<cmd>Telescope lsp_definitions<cr>')
        vim.keymap.set('n', '<cr>lr', '<cmd>Telescope lsp_references<cr>')
        vim.keymap.set('n', '<cr>ls', '<cmd>Telescope lsp_document_symbols<cr>')
        vim.keymap.set('n', '<cr>lw', '<cmd>Telescope lsp_workspace_symbols<cr>')
        vim.keymap.set('n', '<cr>m', '<cmd>Telescope man_pages<cr>')
        vim.keymap.set('n', '<cr>o', '<cmd>Telescope vim_options<cr>')
        vim.keymap.set('n', '<cr>q', '<cmd>Telescope quickfix<cr>')
        vim.keymap.set('n', '<cr>s', '<cmd>Telescope spell_suggest<cr>')
        vim.keymap.set('n', '<cr>t', '<cmd>Telescope filetypes<cr>')
        vim.keymap.set('n', '<cr>f', '<cmd>Telescope file_browser<cr>')
        vim.keymap.set('n', '<cr>F', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>')
    end,
}
