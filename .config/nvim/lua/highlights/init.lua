local highlights = {
    require('highlights.core'),
    require('highlights.float'),
    require('highlights.statusline'),
    require('highlights.tabline'),
    require('highlights.treesitter'),
}

for _, highlight in pairs(highlights) do
    for name, options in pairs(highlight) do
        vim.api.nvim_set_hl(0, name, options)
    end
end
