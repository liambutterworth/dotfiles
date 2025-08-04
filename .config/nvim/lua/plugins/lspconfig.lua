return {
    'neovim/nvim-lspconfig',

    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover, { border = 'single' }
        )

        local function on_attach(client, buffer)
            local options = { silent = true, buffer = buffer }

            vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
            vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
            vim.keymap.set('n', '<c-}>', '<cmd>lua vim.lsp.buf.declaration()<cr>', options)
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', options)
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', options)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.diagnostic.open_float()<cr>', options)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
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

        lspconfig.intelephense.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig.html.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig.cssls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.volar.setup({
            capabilities = capabilities,
            on_attach = on_attach,

            init_options = {
                typescript = {
                    tsdk = '/usr/local/lib/node_modules/typescript/lib'
                }
            }
        })
    end,
}
