local ls = require('luasnip')
local format = require('luasnip.extras.fmt').fmt
local snippet = ls.snippet
local insert = ls.insert_node

ls.add_snippets('php', {
    snippet('pub', format('public function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),

    snippet('pubs', format('public static function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),

    snippet('pro', format('protected function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),

    snippet('pros', format('protected static function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),

    snippet('pri', format('public function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),

    snippet('pris', format('private static function {}({}){}\n{{\n\t{}\n}}', {
        insert(1), insert(2), insert(3), insert(0)
    })),
}, { key = 'php' })
