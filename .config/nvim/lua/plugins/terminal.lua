return {
    'akinsho/toggleterm.nvim',
    version = '*',

    opts = {
        direction = 'float',
        open_mapping = '<c-space>',

        float_opts = {
            border = 'curved',
            width = function() return math.floor(vim.o.columns * 0.8) end,
            height = function() return math.floor(vim.o.lines * 0.8) end,
            winblend = 0,
        },
    },
}
