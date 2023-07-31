return {
    'l3mon4d3/luasnip',

    version = '2.*',

    build = 'make install_jsregexp',

    config = function()
        local ls = require('luasnip')

        require('luasnip.loaders.from_lua').lazy_load({
            paths = '~/.config/nvim/lua/snippets',
        })

        vim.keymap.set({ 'i', 's' }, '<c-j>', function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ 'i', 's' }, '<c-l>', function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set('i', '<c-p>', function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { silent = ture })

        vim.keymap.set('i', '<c-n>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end,
}
