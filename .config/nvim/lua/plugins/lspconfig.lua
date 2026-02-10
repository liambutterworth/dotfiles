return {
    'neovim/nvim-lspconfig',

    config = function()
        vim.lsp.enable('html')
        vim.lsp.enable('cssls')
        vim.lsp.enable('jsonls')
        vim.lsp.enable('intelephense')
        vim.lsp.enable('lua_ls')

        vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition)
        vim.keymap.set('n', '<c-}>', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'S', vim.diagnostic.open_float)

        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'single' })
        end)

        vim.keymap.set('n', '[d', function()
            vim.diagnostic.jump({count= -1,float = true})
        end)

        vim.keymap.set('n', ']d', function()
            vim.diagnostic.jump({count= 1,float = true})
        end)

        vim.lsp.config('lua_ls', {
            on_init = function(client)
                -- if client.workspace_folders then
                --     local path = client.workspace_folders[1].name
                --     if
                --         path ~= vim.fn.stdpath('config')
                --         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                --     then
                --         return
                --     end
                -- end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most
                        -- likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        -- Tell the language server how to find Lua modules same way as Neovim
                        -- (see `:h lua-module-load`)
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library',
                            -- '${3rd}/busted/library',
                        },
                        -- Or pull in all of 'runtimepath'.
                        -- NOTE: this is a lot slower and will cause issues when working on
                        -- your own configuration.
                        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                        -- library = vim.api.nvim_get_runtime_file('', true),
                    },
                })
            end,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },

                    },
                }
            },
        })

        vim.diagnostic.config({
            float = {
                border = 'single',
                source = 'always',
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
    end,
}
