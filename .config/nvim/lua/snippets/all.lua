local ls = require('luasnip')

ls.add_snippets('all', {
    ls.snippet('test', {
        t('testing edit')
    }),
}, { key = 'all' })
