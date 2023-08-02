local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets('all', {
    s('(',   fmt('(\n\t{}\n){}',     { i(1), i(0) })),
    s('(,',  fmt('(\n\t{}\n),{}',    { i(1), i(0) })),
    s('(;',  fmt('(\n\t{}\n);{}',    { i(1), i(0) })),
    s('()',  fmt('(\n\t{}\n)){}',    { i(1), i(0) })),
    s('(),', fmt('(\n\t{}\n)),{}',   { i(1), i(0) })),
    s('();', fmt('(\n\t{}\n));{}',   { i(1), i(0) })),
    s('{',   fmt('{{\n\t{}\n}}{}',   { i(1), i(0) })),
    s('{,',  fmt('{{\n\t{}\n}},{}',  { i(1), i(0) })),
    s('{;',  fmt('{{\n\t{}\n}};{}',  { i(1), i(0) })),
    s('{)',  fmt('{{\n\t{}\n}}){}',  { i(1), i(0) })),
    s('{),', fmt('{{\n\t{}\n}}),{}', { i(1), i(0) })),
    s('{);', fmt('{{\n\t{}\n}});{}', { i(1), i(0) })),
    s('[',   fmt('[\n\t{}\n]{}',     { i(1), i(0) })),
    s('[,',  fmt('[\n\t{}\n],{}',    { i(1), i(0) })),
    s('[;',  fmt('[\n\t{}\n];{}',    { i(1), i(0) })),
    s('[)',  fmt('[\n\t{}\n]){}',    { i(1), i(0) })),
    s('[),', fmt('[\n\t{}\n]),{}',   { i(1), i(0) })),
    s('[);', fmt('[\n\t{}\n]);{}',   { i(1), i(0) })),
}, { key = 'all' })
