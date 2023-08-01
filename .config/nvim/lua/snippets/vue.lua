local ls = require('luasnip')
local extras = require('luasnip.extras')
local postfix = require("luasnip.extras.postfix").postfix
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep
local l = extras.lambda
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node

ls.add_snippets('vue', {
    s('log', fmt('console.log({})', { i(0) })),
    s('setup', fmt('<script setup>\n\n{}\n\n</script>', { i(0) })),

    postfix('>', fmt('<{}{}>\n\t{}{}\n</{}>', {
        l(l.POSTFIX_MATCH),
        i(2),
        i(1),
        i(0),
        l(l.POSTFIX_MATCH),
    })),

    postfix('/', fmt('<{} {}/>', {
        l(l.POSTFIX_MATCH),
        i(0),
    })),

    postfix('.log', fmt('console.log({}{})', {
        l(l.POSTFIX_MATCH),
        i(0),
    })),
}, { key = 'vue' })
