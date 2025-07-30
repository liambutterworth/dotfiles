vim.o.tabline = '%!v:lua.GetTabLine()'

function GetTabLine()
    local tabline = {}
    local tabs = vim.api.nvim_list_tabpages()
    local current_tab = vim.api.nvim_get_current_tabpage()

    for _, tab in ipairs(tabs) do
        local buffer = vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))
        local filename =  vim.api.nvim_buf_get_name(buffer)
        local name = vim.fn.fnamemodify(filename, ':p:t')
        local icon = string.find(filename, 'term://') ~= nil and 'ﲵ' or ''
        local state = tab == current_tab and 'Active' or 'Inactive'

        if vim.bo[buffer].readonly then
            table.insert(tabline, '%#TabLineReadOnly' .. state .. '#')
        elseif vim.bo[buffer].modified then
            table.insert(tabline, '%#TabLineModified' .. state .. '#')
        else
            table.insert(tabline, '%#TabLineUnmodified' .. state .. '#')
        end

        table.insert(tabline, ' ' .. icon .. (tab == current_tab and ' ' or ''))
        table.insert(tabline, '%#TabLine#')
        table.insert(tabline, ' ' .. (name ~= '' and name or 'No Name') .. ' ')

        if next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.ERROR })) then
            table.insert(tabline, '%#TabLineHasErrors#')
        elseif next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.INFO })) then
            table.insert(tabline, '%#TabLineHasInformation#')
        elseif next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.WARN })) then
            table.insert(tabline, '%#TabLineHasWarnings#')
        end

        table.insert(tabline, '●')
        table.insert(tabline, '%#TabLine# ')
    end

    return table.concat(tabline)
end
