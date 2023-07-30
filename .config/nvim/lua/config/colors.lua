--
-- Colors
--
-- :: General
-- :: Treesitter
-- :: Telescope
-- :: Statusline
-- :: Tabline
-- :: Float

function highlight(name, options)
    if options.fg and not options.ctermfg then
        options.ctermfg = options.fg
    end

    if options.bg and not options.ctermbg then
        options.ctermbg = options.bg
    end

    vim.api.nvim_set_hl(0, name, options)
end

--
-- General
--

highlight('Constant', { fg='green' })
highlight('ColorColumn', { bg='red', fg='black' })
highlight('Comment', { fg='black', bold=true })
highlight('CursorLine', { bg='none' })
highlight('DiffAdd', { bg='green', fg='black' })
highlight('DiffChange', { bg='yellow', fg='black' })
highlight('DiffDelete', { bg='red', fg='black' })
highlight('DiffText', { bg='blue', fg='black' })
highlight('Directory', { fg='cyan' })
highlight('Error', { bg='none', fg='red', bold=true })
highlight('ErrorMsg', { bg='none', fg='red', bold=true })
highlight('Folded', { bg='black', fg='white' })
highlight('FoldColumn', { bg='black', fg='white' })
highlight('Identifier', { fg='white' })
highlight('Info', { fg='blue', bold=true })
highlight('LineNr', { fg='black', bold=true })
highlight('MatchParen', { bg='none', fg='yellow', bold=true })
highlight('MoreMsg', { fg='green' })
highlight('ModeMsg', { fg='white' })
highlight('NonText', { bg='none', fg='black', bold=true })
highlight('Normal', { bg='none', fg='white' })
highlight('NormalFloat', { bg='none' })
highlight('Number', { fg='magenta' })
highlight('Operator', { fg='blue' })
highlight('Pmenu', { bg='black', fg='white' })
highlight('PmenuSbar', { bg='black' })
highlight('PmenuSel', { bg='black', fg='white', bold=true })
highlight('PmenuThumb', { bg='white', fg='black', bold=true })
highlight('PreProc', { fg='blue' })
highlight('Question', { fg='yellow' })
highlight('SignColumn', { bg='none', fg='white' })
highlight('Special', { fg='white' })
highlight('SpecialKey', { fg='cyan' })
highlight('SpecialChar', { fg='magenta' })
highlight('SpellBad', { bg='none', fg='red', underline=true })
highlight('SpellCap', { bg='none', fg='blue', underline=true })
highlight('SpellRare', { bg='none', fg='magenta', underline=true })
highlight('SpellLocal', { bg='none', fg='cyan', underline=true })
highlight('Statement', { fg='blue' })
highlight('Title', { fg='cyan', bold=true })
highlight('Todo', { bg='none', fg='yellow' })
highlight('Type', { fg='blue' })
highlight('Underlined', { fg='cyan' })
highlight('VertSplit', { bg='none', fg='black', bold=true })
highlight('Visual', { bg='black', bold=true })
highlight('Warning', { fg='yellow', bold=true })
highlight('WarningMsg', { fg='yellow' })

--
-- Treesitter
--

highlight('@boolean', { fg='magenta' })
highlight('@constant', { fg='cyan' })
highlight('@constant.builtin', { fg='blue' })
highlight('@constructor', { fg='cyan' })
highlight('@float', { fg='magenta' })
highlight('@function', { fg='cyan' })
highlight('@function.builtin', { fg='cyan' })
highlight('@function.call', { fg='cyan' })
highlight('@method', { fg='cyan' })
highlight('@method.call', { fg='cyan' })
highlight('@punctuation.bracket', { fg='white' })
highlight('@punctuation.delimiter', { fg='white' })
highlight('@tag', { fg='blue' })
highlight('@tag.attribute', { fg='cyan' })
highlight('@type', { fg='cyan' })
highlight('@type.builtin', { fg='blue' })
highlight('@type.definition', { fg='cyan' })
highlight('@type.qualifier', { fg='blue' })
highlight('@variable.builtin', { fg='blue' })

--
-- Telescope
--

highlight('TelescopeMatching', { fg='green', bold=true })
highlight('TelescopeMultiSelection', { fg='magenta' })
highlight('TelescopeNormal', { fg='white' })
highlight('TelescopePromptPrefix', { fg='magenta', bold=true })
highlight('TelescopeResultsDiffChange', { bg='none', fg='yellow' })
highlight('TelescopeResultsDiffAdd', { bg='none', fg='green' })
highlight('TelescopeResultsDiffDelete', { bg='none', fg=red })
highlight('TelescopeResultsDiffUntracked', { bg='none', fg=red })
highlight('TelescopeResultsClass', { fg='blue' })
highlight('TelescopeResultsConstant', { fg='magenta' })
highlight('TelescopeResultsField', { fg='blue' })
highlight('TelescopeResultsIdentifier', { fg='yellow' })
highlight('TelescopeResultsFunction', { fg='cyan' })
highlight('TelescopeResultsMethod', { fg='cyan' })
highlight('TelescopeResultsOperator', { fg='blue' })
highlight('TelescopeResultsStruct', { fg='yellow' })
highlight('TelescopeResultsVariable', { fg='blue' })
highlight('TelescopeSelection', { bg='none', fg='white', bold=true })
highlight('TelescopeSelectionCaret', { bg='none', fg='magenta', bold=true })

--
-- Statusline
--

highlight('StatusLine', { bg='none', fg='none' })
highlight('StatusLineNC', { bg='none', fg='white' })
highlight('StatusLineHasErrors', { bg='none', fg='red', bold=true })
highlight('StatusLineHasInformation', { bg='none', fg='blue', bold=true })
highlight('StatusLineHasWarnings', { bg='none', fg='yellow', bold=true })
highlight('StatusLineOperator', { bg='none', fg='blue', bold=true })
highlight('StatusLineNormal', { bg='black', fg='none' })
highlight('StatusLineNumber', { bg='none', fg='magenta', bold=true })
highlight('StatusLineInactive', { bg='white', fg='black', bold=true })
highlight('StatusLineModified', { bg='yellow', fg='black' })
highlight('StatusLineUnmodified', { bg='green', fg='black' })
highlight('StatusLineReadOnly', { bg='red', fg='black' })

--
-- Tabline
--

highlight('TabLine', { bg='none', fg='white' })
highlight('TablineHasErrors', { bg='none', fg='red' })
highlight('TablineHasInformation', { bg='none', fg='blue' })
highlight('TablineHasWarnings', { bg='none', fg='yellow' })
highlight('TabLineModifiedActive', { bg='yellow', fg='black' })
highlight('TabLineModifiedInactive', { bg='none', fg='yellow' })
highlight('TabLineReadOnlyActive', { bg='red', fg='black' })
highlight('TabLineReadOnlyInactive', { bg='none', fg='red' })
highlight('TabLineUnmodifiedActive', { bg='green', fg='black' })
highlight('TabLineUnmodifiedInactive', { bg='none', fg='green' })

--
-- Float
--

highlight('Float', { bg='none' })
highlight('FloatBorder', { bg='none', fg='none' })
highlight('FloatShadow', { bg='none' })
highlight('FloatShadowThrough', { bg='yellow', bold=true })
