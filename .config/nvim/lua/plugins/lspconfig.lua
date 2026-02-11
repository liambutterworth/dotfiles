return {
    'neovim/nvim-lspconfig',

    dependencies = {
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
    },

    config = function()
        require('mason').setup({
            ui = {
                border = 'single',
            },
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'cssls',
                'html',
                'intelephense',
                'jsonls',
                'lua_ls',
                'sqlls',
                'ts_ls',
                'vtsls',
                'vue_ls',
            },
        })

        vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition)
        vim.keymap.set('n', '<c-}>', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'S', vim.diagnostic.open_float)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single' }) end)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count= -1,float = true}) end)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count= 1,float = true}) end)

        vim.diagnostic.config({
            float = {
                border = 'single',
            },

            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                },
            },
        })

        vim.lsp.config('lua_ls', {
            on_init = function(client)
                local config = {
                    runtime = {
                        version = 'LuaJIT',

                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },

                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                }

                client.config.settings.Lua = vim.tbl_deep_extend(
                    'force',
                    client.config.settings.Lua,
                    config
                )
            end,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                }
            },
        })

        vim.lsp.config('sqlls', {
            settings = {
                sqlLanguageServer = {
                    lint = {
                        rules = {}
                    },
                },
            },
        })

        vim.lsp.config('vtsls', {
            settings = {
                vtsls = {
                    tsserver = {
                        globalPlugins = {
                            {
                                name = '@vue/typescript-plugin',
                                languages = { 'vue' },
                                configNamespace = 'typescript',

                                location = vim.fn.stdpath('data')
                                    .. '/mason/packages/vue-language-server'
                                    .. '/node_modules/@vue/language-server'
                            },
                        },
                    },
                },
            },

            filetypes = {
                'javascript',
                'typescript',
                'vue',
            },
        })
    end,
}
