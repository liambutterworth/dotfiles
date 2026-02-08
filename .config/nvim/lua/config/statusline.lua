vim.o.statusline = '%!v:lua.GetStatusLine()'

function GetStatusLine()
    return '%{%v:lua.GetStatusLineForBuffer(' .. vim.fn.bufnr() .. ')%}'
end

function GetStatusLineForBuffer(buffer)
    local statusline = {}

    table.insert(statusline, '%#StatusLine#')

    if vim.fn.reg_recording() ~= '' then
        table.insert(statusline, '%#StatusLineIsRecording#')
    elseif buffer ~= vim.fn.bufnr('%') then
        table.insert(statusline, '%#StatusLineInactive#')
    elseif vim.bo[buffer].readonly then
        table.insert(statusline, '%#StatusLineReadOnly#')
    elseif vim.bo[buffer].modified then
        table.insert(statusline, '%#StatusLineModified#')
    else
        table.insert(statusline, '%#StatusLineUnmodified#')
    end

    if vim.fn.reg_recording() ~= '' then
        table.insert(statusline, ' 󰑊 ')
    else
        table.insert(statusline, '  ')
    end

    table.insert(statusline, '%#StatusLine# %f%<%=')
    table.insert(statusline, '%#StatusLineNumber#%l')
    table.insert(statusline, '%#StatusLineOperator#/')
    table.insert(statusline, '%#StatusLineNumber#%L')
    table.insert(statusline, '%#StatusLineOperator#:')
    table.insert(statusline, '%#StatusLineNumber#%c')
    table.insert(statusline, '%#StatusLineOperator# │')

    if next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.ERROR })) then
        table.insert(statusline, '%#StatusLineHasErrors#')
    elseif next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.INFO })) then
        table.insert(statusline, '%#StatusLineHasInformation#')
    elseif next(vim.diagnostic.get(buffer, { severity = vim.diagnostic.severity.WARN })) then
        table.insert(statusline, '%#StatusLineHasWarnings#')
    else
        table.insert(statusline, '%#StatusLine#')
    end

    table.insert(statusline, ' 󰑊 ')

    return table.concat(statusline)
end
