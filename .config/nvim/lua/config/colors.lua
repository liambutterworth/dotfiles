colors = {
    none = 'none',
    black = 0,
    red = 1,
    green = 2,
    yellow = 3,
    blue = 4,
    magenta = 5,
    cyan = 6,
    white = 7,
    brblack = 8,
    brred = 9,
    brgreen = 10,
    bryellow = 11,
    brblue = 12,
    brmagenta = 13,
    brcyan = 14,
    brwhite = 15,
}

function highlight(name, options)
    if options.fg and not options.ctermfg then
        options.ctermfg = options.fg
    end

    if options.bg and not options.ctermbg then
        options.ctermbg = options.bg
    end

    vim.api.nvim_set_hl(0, name, options)
end

highlight('Constant', { fg=colors.green })
highlight('ColorColumn', { bg=colors.red, fg=colors.black })
highlight('Comment', { fg=colors.brblack, bold=true })
highlight('CursorLine', { bg=colors.none })
highlight('DiffAdd', { bg=colors.green, fg=colors.black })
highlight('DiffChange', { bg=colors.yellow, fg=colors.black })
highlight('DiffDelete', { bg=colors.red, fg=colors.black })
highlight('DiffText', { bg=colors.blue, fg=colors.black })
highlight('Directory', { fg=colors.cyan })
highlight('Error', { bg=colors.none, fg=colors.red, bold=true })
highlight('ErrorMsg', { bg=colors.none, fg=colors.red, bold=true })
highlight('ExtraWhiteSpace', { fg=colors.brblack })
highlight('Folded', { bg=colors.black, fg=colors.white })
highlight('FoldColumn', { bg=colors.black, fg=colors.white })
highlight('Identifier', { fg=colors.white })
highlight('Info', { fg=colors.blue, bold=true })
highlight('LineNr', { fg=colors.brblack, bold=true })
highlight('MatchParen', { bg=colors.none, fg=colors.yellow, bold=true })
highlight('MoreMsg', { fg=colors.green })
highlight('ModeMsg', { fg=colors.white })
highlight('NonText', { bg=colors.none, fg=colors.black, bold=true })
highlight('Normal', { bg=colors.none, fg=colors.white })
highlight('NormalFloat', { bg=colors.none })
highlight('Number', { fg=colors.magenta })
highlight('Operator', { fg=colors.blue})
highlight('Pmenu', { bg=colors.black, fg=colors.white })
highlight('PmenuSbar', { bg=colors.black })
highlight('PmenuSel', { bg=colors.black, fg=colors.white, bold=true })
highlight('PmenuThumb', { bg=colors.white, fg=colors.black, bold=true })
highlight('PreProc', { fg=colors.blue})
highlight('Question', { fg=colors.yellow })
highlight('SignColumn', { bg=colors.none, fg=colors.white })
highlight('Special', { fg=colors.white })
highlight('SpecialKey', { fg=colors.cyan })
highlight('SpecialChar', { fg=colors.magenta })
highlight('SpellBad', { bg=colors.none, fg=colors.red, underline=true })
highlight('SpellCap', { bg=colors.none, fg=colors.blue, underline=true })
highlight('SpellRare', { bg=colors.none, fg=colors.magenta, underline=true })
highlight('SpellLocal', { bg=colors.none, fg=colors.cyan, underline=true })
highlight('Statement', { fg=colors.blue})
highlight('Title', { fg=colors.cyan, bold=true })
highlight('Todo', { bg=colors.none, fg=colors.yellow })
highlight('Type', { fg=colors.blue})
highlight('Underlined', { fg=colors.cyan })
highlight('VertSplit', { bg=colors.none, fg=colors.black, bold=true })
highlight('Visual', { bg=colors.black, bold=true })
highlight('Warning', { fg=colors.yellow, bold=true })
highlight('WarningMsg', { fg=colors.yellow })
highlight('@boolean', { fg=colors.magenta })
highlight('@constant', { fg=colors.cyan })
highlight('@constant.builtin', { fg=colors.blue})
highlight('@constructor', { fg=colors.cyan })
highlight('@function', { fg=colors.cyan })
highlight('@function.builtin', { fg=colors.cyan })
highlight('@function.call', { fg=colors.cyan })
highlight('@number.float', { fg=colors.magenta })
highlight('@method', { fg=colors.cyan })
highlight('@method.call', { fg=colors.cyan })
highlight('@module', { fg=colors.white })
highlight('@punctuation.bracket', { fg=colors.white })
highlight('@punctuation.delimiter', { fg=colors.white })
highlight('@tag', { fg=colors.blue})
highlight('@tag.attribute', { fg=colors.cyan })
highlight('@type', { fg=colors.cyan })
highlight('@type.builtin', { fg=colors.blue})
highlight('@type.definition', { fg=colors.cyan })
highlight('@type.qualifier', { fg=colors.blue})
highlight('@variable.builtin', { fg=colors.blue})
highlight('@variable', { fg=colors.white })
highlight('TelescopeMatching', { fg=colors.green, bold=true })
highlight('TelescopeMultiSelection', { fg=colors.magenta })
highlight('TelescopeNormal', { fg=colors.white })
highlight('TelescopePromptPrefix', { fg=colors.magenta, bold=true })
highlight('TelescopeResultsDiffChange', { bg=colors.none, fg=colors.yellow })
highlight('TelescopeResultsDiffAdd', { bg=colors.none, fg=colors.green })
highlight('TelescopeResultsDiffDelete', { bg=colors.none, fg=red })
highlight('TelescopeResultsDiffUntracked', { bg=colors.none, fg=red })
highlight('TelescopeResultsClass', { fg=colors.blue})
highlight('TelescopeResultsConstant', { fg=colors.magenta })
highlight('TelescopeResultsField', { fg=colors.blue})
highlight('TelescopeResultsIdentifier', { fg=colors.yellow })
highlight('TelescopeResultsFunction', { fg=colors.cyan })
highlight('TelescopeResultsMethod', { fg=colors.cyan })
highlight('TelescopeResultsOperator', { fg=colors.blue})
highlight('TelescopeResultsStruct', { fg=colors.yellow })
highlight('TelescopeResultsVariable', { fg=colors.blue})
highlight('TelescopeSelection', { bg=colors.none, fg=colors.white, bold=true })
highlight('TelescopeSelectionCaret', { bg=colors.none, fg=colors.magenta, bold=true })
highlight('StatusLine', { bg=colors.none, fg=colors.none })
highlight('StatusLineNC', { bg=colors.none, fg=colors.white })
highlight('StatusLineHasErrors', { bg=colors.none, fg=colors.red, bold=true })
highlight('StatusLineHasInformation', { bg=colors.none, fg=colors.blue, bold=true })
highlight('StatusLineHasWarnings', { bg=colors.none, fg=colors.yellow, bold=true })
highlight('StatusLineOperator', { bg=colors.none, fg=colors.blue, bold=true })
highlight('StatusLineNormal', { bg=colors.black, fg=colors.none })
highlight('StatusLineNumber', { bg=colors.none, fg=colors.magenta, bold=true })
highlight('StatusLineInactive', { bg=colors.white, fg=colors.black, bold=true })
highlight('StatusLineModified', { bg=colors.yellow, fg=colors.black })
highlight('StatusLineUnmodified', { bg=colors.green, fg=colors.black })
highlight('StatusLineReadOnly', { bg=colors.red, fg=colors.black })
highlight('TabLine', { bg=colors.none, fg=colors.white })
highlight('TablineHasErrors', { bg=colors.none, fg=colors.red })
highlight('TablineHasInformation', { bg=colors.none, fg=colors.blue })
highlight('TablineHasWarnings', { bg=colors.none, fg=colors.yellow })
highlight('TabLineModifiedActive', { bg=colors.yellow, fg=colors.black })
highlight('TabLineModifiedInactive', { bg=colors.none, fg=colors.yellow })
highlight('TabLineReadOnlyActive', { bg=colors.red, fg=colors.black })
highlight('TabLineReadOnlyInactive', { bg=colors.none, fg=colors.red })
highlight('TabLineUnmodifiedActive', { bg=colors.green, fg=colors.black })
highlight('TabLineUnmodifiedInactive', { bg=colors.none, fg=colors.green })
highlight('Float', { bg=colors.none })
highlight('FloatBorder', { bg=colors.none, fg=colors.none })
highlight('FloatShadow', { bg=colors.none })
highlight('FloatShadowThrough', { bg=colors.yellow, bold=true })
