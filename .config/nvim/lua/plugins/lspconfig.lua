return {
    'neovim/nvim-lspconfig',

    config = function()
        local config = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local function on_attach(client, buffer)
            vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

            vim.api.nvim_buf_set_keymap(buffer, 'n', 'K', '<cmd>lua vim.lsp.buf.hover({ border = "single" })<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', '<c-}>', '<cmd>lua vim.lsp.buf.declaration()<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gi', '<cmd>lua vim.diagnostic.open_float()<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(buffer, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { silent = true })
        end

        local signs = {
            Error = '●',
            Warn = '●',
            Hint = '●',
            Info = '●',
        }

        for type, icon in pairs(signs) do
            local highlight = "DiagnosticSign" .. type

            vim.fn.sign_define(highlight, {
                text = icon,
                texthl = highlight,
                numhl = '',
            })
        end

        capabilities.textDocument.completion.completionItem.snippetSupport = true

        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                'documentation',
                'detail',
                'additionalTextEdits',
            }
        }

        config.rust_analyzer.setup {
            capabilities = capabilities,
        }

        config.html.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        config.tailwindcss.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        config.jsonls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        config.volar.setup {
            capabilities = capabilities,
            on_attach = on_attach,

            init_options = {
                typescript = {
                    serverPath = '/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js'
                }
            }
        }

        config.intelephense.setup {
            capabilities = capabilities,
            on_attach = on_attach
        }
    end,
}
