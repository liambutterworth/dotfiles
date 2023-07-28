local statusline = {
    buffer = nil,
    is_active = false,
    segments = {},
    window = nil,
}

function statusline:clear()
    self.segments = {}
end

function statusline:build()
    return table.concat(self.segments)
end

function statusline:highlight(name)
    self:add('%#StatusLine' .. (name or '') .. '#')
end

function statusline:add(segment)
    table.insert(self.segments, segment)
end

function statusline:add_separator()
    self:highlight('Separator')
    self:add(' ')
    self:highlight()
end

function statusline:add_space()
    self:add(' ')
end

function statusline:add_bar()
    self:highlight('Operator')
    self:add(' │')
    self:highlight()
end

function statusline:add_file()
    if not self.is_active then
        self:highlight('Inactive')
    elseif vim.bo[self.buffer].readonly then
        self:highlight('ReadOnly')
    elseif vim.bo[self.buffer].modified then
        self:highlight('Modified')
    else
        self:highlight('Unmodified')
    end

    self:add_space()
    self:add('')
    self:add_space()
    self:highlight()
    self:add_space()
    self:add('%f%<%=')
end

function statusline:add_line_number()
    self:add_separator()
    self:add_space()
    self:highlight('Number')
    self:add('%l')
    self:highlight('Operator')
    self:add('/')
    self:highlight('Number')
    self:add('%L')
    self:highlight('Operator')
    self:add(':')
    self:highlight('Number')
    self:add('%c')
    self:add_bar()
    self:add_separator()
end

function statusline:add_branch()
    if vim.b.gitsigns_head then
        self:highlight('Icon')
        self:add('')
        self:highlight()
        self:add_space()

        if #vim.b.gitsigns_status > 0 then
            self:highlight('Dirty')
        else
            self:highlight('Clean')
        end

        self:add(vim.b.gitsigns_head)
        self:add_bar()
        self:add_separator()
    end
end

function statusline:add_diagnostics()
    if next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.ERROR })) then
        self:highlight('HasErrors')
    elseif next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.INFO })) then
        self:highlight('HasInformation')
    elseif next(vim.diagnostic.get(self.buffer, { severity = vim.diagnostic.severity.WARN })) then
        self:highlight('HasWarnings')
    end

    self:add('●')
    self:add_space()
end

function statusline:get()
    self.is_active = vim.w.is_active
    self.window = vim.fn.winnr()
    self.buffer = vim.fn.winbufnr(self.window)

    self:clear()
    self:add_file()
    self:add_line_number()
    self:add_branch()
    self:add_diagnostics()

    return self:build()
end

return statusline
