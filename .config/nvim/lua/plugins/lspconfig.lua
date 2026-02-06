return {
    'neovim/nvim-lspconfig',

    config = function()
        vim.lsp.enable('intelephense')
        vim.lsp.enable('html')
        vim.lsp.enable('cssls')
        vim.lsp.enable('jsonls')
        vim.lsp.enable('vue_ls')

        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition)
        vim.keymap.set('n', '<c-}>', vim.lsp.buf.declaration)

        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'single' })
        end)

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '●',
                    [vim.diagnostic.severity.WARN] = '●',
                    [vim.diagnostic.severity.INFO] = '●',
                    [vim.diagnostic.severity.HINT] = '●',
                },
            },
        })
    end,
}
