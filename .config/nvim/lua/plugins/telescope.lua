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

        vim.keymap.set('n', '<space><space>', '<cmd>Telescope find_files<cr>', { noremap = true })
        vim.keymap.set('n', '<space><bs>', '<cmd>Telescope buffers<cr>', { noremap = true })
        vim.keymap.set('n', '<space><tab>', '<cmd>Telescope jumplist<cr>', { noremap = true })
        vim.keymap.set('n', '<space>.', '<cmd>Telescope find_files cwd=%:h<cr>', { noremap = true })
        vim.keymap.set('n', '<space>[', '<cmd>Telescope tagstack<cr>', { noremap = true })
        vim.keymap.set('n', '<space>]', '<cmd>Telescope tags<cr>', { noremap = true })
        vim.keymap.set('n', '<space>}', '<cmd>Telescope buffer_tags<cr>', { noremap = true })
        vim.keymap.set('n', '<space>:', '<cmd>Telescope command_history<cr>', { noremap = true })
        vim.keymap.set('n', "<space>'", '<cmd>Telescope marks<cr>', { noremap = true })
        vim.keymap.set('n', '<space>"', '<cmd>Telescope registers<cr>', { noremap = true })
        vim.keymap.set('n', '<space>j', '<cmd>Telescope live_grep<cr>', { noremap = true })
        vim.keymap.set('n', '<space>k', '<cmd>Telescope live_grep search_dirs=%:h<cr>', { noremap = true })
        vim.keymap.set('n', '<space>l', '<cmd>Telescope live_grep grep_open_files=true<cr>', { noremap = true })
        vim.keymap.set('n', '<space>/', '<cmd>Telescope search_history<cr>', { noremap = true })
        vim.keymap.set('n', '<space>?', '<cmd>Telescope help_tags<cr>', { noremap = true })
        vim.keymap.set('n', '<space>c', '<cmd>Telescope commands<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gf', '<cmd>Telescope git_files<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gs', '<cmd>Telescope git_status<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gl', '<cmd>Telescope git_commits<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gc', '<cmd>Telescope git_bcommits<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gb', '<cmd>Telescope git_branches<cr>', { noremap = true })
        vim.keymap.set('n', '<space>gt', '<cmd>Telescope git_stash<cr>', { noremap = true })
        vim.keymap.set('n', '<space>la', '<cmd>Telescope lsp_code_actions<cr>', { noremap = true })
        vim.keymap.set('n', '<space>ld', '<cmd>Telescope lsp_document_diagnostics<cr>', { noremap = true })
        vim.keymap.set('n', '<space>li', '<cmd>Telescope lsp_implementations<cr>', { noremap = true })
        vim.keymap.set('n', '<space>lk', '<cmd>Telescope lsp_definitions<cr>', { noremap = true })
        vim.keymap.set('n', '<space>lr', '<cmd>Telescope lsp_references<cr>', { noremap = true })
        vim.keymap.set('n', '<space>ls', '<cmd>Telescope lsp_document_symbols<cr>', { noremap = true })
        vim.keymap.set('n', '<space>lw', '<cmd>Telescope lsp_workspace_symbols<cr>', { noremap = true })
        vim.keymap.set('n', '<space>m', '<cmd>Telescope man_pages<cr>', { noremap = true })
        vim.keymap.set('n', '<space>o', '<cmd>Telescope vim_options<cr>', { noremap = true })
        vim.keymap.set('n', '<space>q', '<cmd>Telescope quickfix<cr>', { noremap = true })
        vim.keymap.set('n', '<space>s', '<cmd>Telescope spell_suggest<cr>', { noremap = true })
        vim.keymap.set('n', '<space>t', '<cmd>Telescope filetypes<cr>', { noremap = true })
        vim.keymap.set('n', '<space>f', '<cmd>Telescope file_browser<cr>', { noremap = true })
        vim.keymap.set('n', '<space>F', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', { noremap = true })

        vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg='green', bold=true })
        vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg='magenta' })
        vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg='white' })
        vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg='magenta', bold=true })
        vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { bg='none', fg='yellow' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { bg='none', fg='green' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { bg='none', fg=red })
        vim.api.nvim_set_hl(0, 'TelescopeResultsDiffUntracked', { bg='none', fg=red })
        vim.api.nvim_set_hl(0, 'TelescopeResultsClass', { fg='blue' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsConstant', { fg='magenta' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsField', { fg='blue' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsIdentifier', { fg='yellow' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsFunction', { fg='cyan' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsMethod', { fg='cyan' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsOperator', { fg='blue' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsStruct', { fg='yellow' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsVariable', { fg='blue' })
        vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg='none', fg='white', bold=true })
        vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { bg='none', fg='magenta', bold=true })
    end,
}
