return {
    'lewis6991/gitsigns.nvim',

    config = function ()
        local gitsigns = require('gitsigns')

        gitsigns.setup({
            signs = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '┃' },
                topdelete = { text = '┃' },
                changedelete = { text = '󰜥' },
                untracked = { text = '┆' },
            },

            signs_staged = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '┃' },
                topdelete = { text = '┃' },
                changedelete = { text = '󰜥' },
                untracked = { text = '┆' },
            },

            on_attach = function (buffer)
                local function keymap(mode, map, callback, options)
                    options = options or {}
                    options.buffer = buffer
                    vim.keymap.set(mode, map, callback, options)
                end

                keymap('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                keymap('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)
            end
        })
    end
}
