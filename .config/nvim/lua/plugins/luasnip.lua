return {
    'l3mon4d3/luasnip',

    version = '2.*',

    build = 'make install_jsregexp',

    config = function()
        local luasnip = require('luasnip')

        -- TODO these dont seem to be loading
        require('luasnip.loaders.from_vscode').load({
            paths = { vim.fn.stdpath('config') .. '/snippets' }
        })

        vim.keymap.set({ 'i', 's' }, '<c-j>', function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end)

        vim.keymap.set({ 'i', 's' }, '<c-l>', function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set('i', '<c-p>', function()
            if luasnip.choice_active() then
                luasnip.change_choice(-1)
            end
        end)

        vim.keymap.set('i', '<c-n>', function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end)
    end,
}
