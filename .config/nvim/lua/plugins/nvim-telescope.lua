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

        vim.api.nvim_set_keymap('n', '<space><space>', '<cmd>Telescope find_files<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space><bs>', '<cmd>Telescope buffers<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space><tab>', '<cmd>Telescope jumplist<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>.', '<cmd>Telescope find_files cwd=%:h<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>[', '<cmd>Telescope tagstack<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>]', '<cmd>Telescope tags<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>}', '<cmd>Telescope buffer_tags<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>:', '<cmd>Telescope command_history<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', "<space>'", '<cmd>Telescope marks<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>"', '<cmd>Telescope registers<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>j', '<cmd>Telescope live_grep<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>k', '<cmd>Telescope live_grep search_dirs=%:h<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>l', '<cmd>Telescope live_grep grep_open_files=true<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>/', '<cmd>Telescope search_history<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>?', '<cmd>Telescope help_tags<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>c', '<cmd>Telescope commands<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gf', '<cmd>Telescope git_files<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gs', '<cmd>Telescope git_status<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gl', '<cmd>Telescope git_commits<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gc', '<cmd>Telescope git_bcommits<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gb', '<cmd>Telescope git_branches<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>gt', '<cmd>Telescope git_stash<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>la', '<cmd>Telescope lsp_code_actions<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>ld', '<cmd>Telescope lsp_document_diagnostics<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>li', '<cmd>Telescope lsp_implementations<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>lk', '<cmd>Telescope lsp_definitions<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>lr', '<cmd>Telescope lsp_references<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>ls', '<cmd>Telescope lsp_document_symbols<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>lw', '<cmd>Telescope lsp_workspace_symbols<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>m', '<cmd>Telescope man_pages<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>o', '<cmd>Telescope vim_options<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>q', '<cmd>Telescope quickfix<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>s', '<cmd>Telescope spell_suggest<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>t', '<cmd>Telescope filetypes<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope file_browser<cr>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<space>F', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', { noremap = true })

        vim.cmd([[
            highlight TelescopeMatching cterm=bold ctermfg=green
            highlight TelescopeMultiSelection ctermfg=magenta
            highlight TelescopeNormal cterm=none ctermfg=white
            highlight TelescopePromptPrefix cterm=bold ctermfg=magenta
            highlight TelescopeResultsDiffChange ctermbg=none ctermfg=yellow
            highlight TelescopeResultsDiffAdd ctermbg=none ctermfg=green
            highlight TelescopeResultsDiffDelete ctermbg=none ctermfg=red
            highlight TelescopeResultsDiffUntracked ctermbg=none ctermfg=red
            highlight TelescopeResultsClass ctermfg=blue
            highlight TelescopeResultsConstant ctermfg=magenta
            highlight TelescopeResultsField ctermfg=blue
            highlight TelescopeResultsIdentifier ctermfg=yellow
            highlight TelescopeResultsFunction ctermfg=cyan
            highlight TelescopeResultsMethod ctermfg=cyan
            highlight TelescopeResultsOperator ctermfg=blue
            highlight TelescopeResultsStruct ctermfg=yellow
            highlight TelescopeResultsVariable ctermfg=blue
            highlight TelescopeSelection cterm=bold ctermbg=none ctermfg=white
            highlight TelescopeSelectionCaret cterm=bold ctermbg=none ctermfg=magenta
        ]])
    end,
}
