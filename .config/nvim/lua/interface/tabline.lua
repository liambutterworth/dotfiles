local tabline = {
    segments = {},
}

function tabline:clear()
    self.segments = {}
end

function tabline:build()
    return table.concat(self.segments)
end

function tabline:add(segment)
    table.insert(self.segments, segment)
end

function tabline:highlight(name)
    self:add('%#TabLine' .. (name or '') .. '#')
end

function tabline:add_space()
    self:add(' ')
end

function tabline:add_tab(tab, is_active)
    local window = vim.api.nvim_tabpage_get_win(tab)
    local buffer = vim.api.nvim_win_get_buf(window)
    local filename =  vim.api.nvim_buf_get_name(buffer)
    local name = vim.fn.fnamemodify(filename, ':p:t')
    local extension = vim.fn.fnamemodify(filename, ':e')
    local is_terminal = string.find(filename, 'term://') ~= nil
    local is_empty = name == ''

    local function highlight(name)
        local state = is_active and 'Active' or 'Inactive'

        return self:highlight(state .. (name or ''))
    end

    if is_terminal then
        self:add(highlight('IconTerminal'))
    elseif vim.bo[buffer].readonly then
        self:add(highlight('IconReadOnly'))
    elseif vim.bo[buffer].modified then
        self:add(highlight('IconModified'))
    else
        self:add(highlight('IconUnmodified'))
    end

    self:add_space()
    self:add(is_terminal and 'ﲵ' or '')
    self:add(highlight())
    self:add_space()
    self:add(is_empty and 'No Name' or name)
    self:add_space()

    if next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.ERROR })) then
        self:highlight('HasErrors')
    elseif next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.INFO })) then
        self:highlight('HasInformation')
    elseif next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.WARN })) then
        self:highlight('HasWarnings')
    end

    self:add('●')
    self:add(highlight())
    self:add_space()
end

function tabline:get()
    local tabs = vim.api.nvim_list_tabpages()
    local current = vim.api.nvim_get_current_tabpage()

    self:clear()

    for _, tab in ipairs(tabs) do
        self:add_tab(tab, tab == current)
    end

    self:highlight()

    return self:build()
end

return tabline
