return {
    'neovim/nvim-lspconfig',

    config = function()
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover, { border = 'single' }
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('LspAttach', { clear = true }),

            callback = function(args)
                local options = { buffer = args.buf }

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
                vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
                vim.keymap.set('n', '<c-}>', '<cmd>lua vim.lsp.buf.declaration()<cr>', options)
                vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', options)
                vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', options)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.diagnostic.open_float()<cr>', options)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
            end
        })

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

        vim.lsp.enable('intelephense')
        vim.lsp.enable('html')
        vim.lsp.enable('cssls')
        vim.lsp.enable('jsonls')
        -- vim.lsp.enable('vue_ls')
    end,
}
