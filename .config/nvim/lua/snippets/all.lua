local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets('all', {
    s({ trig = '(', priority = 1 }, fmt('(\n\t{}\n)', { i(0) })),
    s({ trig = '(,', priority = 1 }, fmt('(\n\t{}\n),', { i(0) })),
    s({ trig = '(;', priority = 1 }, fmt('(\n\t{}\n);', { i(0) })),
    s({ trig = '{', priority = 1 }, fmt('{{\n\t{}\n}}', { i(0) })),
    s({ trig = '{,', priority = 1 }, fmt('{{\n\t{}\n}},', { i(0) })),
    s({ trig = '{;', priority = 1 }, fmt('{{\n\t{}\n}};', { i(0) })),
    s({ trig = '({', priority = 2 }, fmt('({{\n\t{}\n}})', { i(0) })),
    s({ trig = '({,', priority = 2 }, fmt('({{\n\t{}\n}}),', { i(0) })),
    s({ trig = '({;', priority = 2 }, fmt('({{\n\t{}\n}});', { i(0) })),
    s({ trig = '[', priority = 1 }, fmt('[\n\t{}\n]', { i(0) })),
    s({ trig = '[,', priority = 1 }, fmt('[\n\t{}\n],', { i(0) })),
    s({ trig = '[;', priority = 1 }, fmt('[\n\t{}\n];', { i(0) })),
    s({ trig = '([', priority = 2 }, fmt('([\n\t{}\n])', { i(0) })),
    s({ trig = '([,', priority = 2 }, fmt('([\n\t{}\n]),', { i(0) })),
    s({ trig = '([;', priority = 2 }, fmt('([\n\t{}\n]);', { i(0) })),
}, { key = 'all' })
