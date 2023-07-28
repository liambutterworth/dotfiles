"
" Custom Theme
"
" :: General
" :: Treesitter
" :: Tabline
" :: Statusline
" :: Pmenu
" :: Float
" :: Plugins
" :: Syntax

set background=dark

highlight clear

"
" General
"

highlight Constant ctermfg=green
highlight ColorColumn ctermbg=red ctermfg=black
highlight Comment cterm=bold ctermfg=black
highlight CursorLine cterm=none
highlight DiffAdd ctermbg=green ctermfg=black
highlight DiffChange ctermbg=yellow ctermfg=black
highlight DiffDelete ctermbg=red ctermfg=black
highlight DiffText ctermbg=blue ctermfg=black
highlight Directory ctermfg=cyan
highlight Error cterm=bold ctermbg=none ctermfg=red
highlight ErrorMsg cterm=bold ctermbg=none ctermfg=red
highlight Folded ctermbg=black ctermfg=white
highlight FoldColumn ctermbg=black ctermfg=white
highlight Identifier cterm=none ctermfg=white
highlight Info cterm=bold ctermfg=blue
highlight LineNr cterm=bold ctermfg=black
highlight MatchParen cterm=bold ctermbg=none ctermfg=yellow
highlight MoreMsg ctermfg=green
highlight ModeMsg cterm=none ctermfg=white
highlight NonText cterm=bold ctermbg=none ctermfg=black
highlight Normal ctermbg=none ctermfg=white
highlight NormalFloat ctermbg=none
highlight Number ctermfg=magenta
highlight Operator ctermfg=blue
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSbar ctermbg=black
highlight PmenuSel cterm=bold ctermbg=black ctermfg=white
highlight PmenuThumb cterm=bold ctermbg=white ctermfg=black
highlight PreProc cterm=none ctermfg=blue
highlight Question ctermfg=yellow
highlight SignColumn ctermbg=none ctermfg=white
highlight Special ctermfg=white
highlight SpecialKey ctermfg=cyan
highlight SpecialChar ctermfg=magenta
highlight SpellBad cterm=underline ctermbg=none ctermfg=red
highlight SpellCap cterm=underline ctermbg=none ctermfg=blue
highlight SpellRare cterm=underline ctermbg=none ctermfg=magenta
highlight SpellLocal cterm=underline ctermbg=none ctermfg=cyan
highlight Statement ctermfg=blue
highlight Title cterm=bold ctermfg=cyan
highlight Todo ctermbg=none ctermfg=yellow
highlight Type ctermfg=blue
highlight Underlined ctermfg=cyan
highlight VertSplit cterm=bold ctermbg=none ctermfg=black
highlight Visual cterm=bold ctermbg=black
highlight Warning cterm=bold ctermfg=yellow
highlight WarningMsg ctermfg=yellow

"
" Treesitter
"

highlight @boolean ctermfg=magenta
highlight @constant ctermfg=cyan
highlight @constant.builtin ctermfg=blue
highlight @constructor ctermfg=cyan
highlight @float ctermfg=magenta
highlight @function ctermfg=cyan
highlight @function.builtin ctermfg=cyan
highlight @function.call ctermfg=cyan
highlight @method ctermfg=cyan
highlight @method.call ctermfg=cyan
highlight @punctuation.bracket ctermfg=white
highlight @punctuation.delimiter ctermfg=white
highlight @tag ctermfg=blue
highlight @tag.attribute ctermfg=cyan
highlight @type ctermfg=cyan
highlight @type.builtin ctermfg=blue
highlight @type.definition ctermfg=cyan
highlight @type.qualifier ctermfg=blue
highlight @variable.builtin ctermfg=blue

"
" Tabline
"

highlight TabLine cterm=none ctermbg=black
highlight TabLineActive cterm=none ctermbg=none ctermfg=white
highlight TabLineActiveClean cterm=bold ctermbg=none ctermfg=green
highlight TabLineActiveHasErrors cterm=bold ctermbg=none ctermfg=red
highlight TabLineActiveHasInformation cterm=bold ctermbg=none ctermfg=blue
highlight TabLineActiveHasWarnings cterm=bold ctermbg=none ctermfg=yellow
highlight TabLineActiveIconModified cterm=bold ctermbg=none ctermfg=yellow
highlight TabLineActiveIconReadOnly cterm=bold ctermbg=none ctermfg=red
highlight TabLineActiveIconTerminal cterm=bold ctermbg=none ctermfg=magenta
highlight TabLineActiveIconUnmodified cterm=bold ctermbg=none ctermfg=green
highlight TabLineInactive cterm=none ctermbg=black ctermfg=white
highlight TabLineInactiveClean cterm=bold ctermbg=black ctermfg=green
highlight TabLineInactiveHasErrors cterm=bold ctermbg=black ctermfg=red
highlight TabLineInactiveHasInformation cterm=bold ctermbg=black ctermfg=blue
highlight TabLineInactiveHasWarnings cterm=bold ctermbg=black ctermfg=yellow
highlight TabLineInactiveIconModified cterm=bold ctermbg=black ctermfg=yellow
highlight TabLineInactiveIconReadOnly cterm=bold ctermbg=black ctermfg=red
highlight TabLineInactiveIconTerminal cterm=bold ctermbg=black ctermfg=magenta
highlight TabLineInactiveIconUnmodified cterm=bold ctermbg=black ctermfg=green
highlight TabLineInactiveIconModified cterm=bold ctermbg=black ctermfg=yellow

"
" Statusline
"

highlight StatusLine cterm=none ctermbg=none ctermfg=none
highlight StatusLineClean cterm=bold ctermbg=none ctermfg=green
highlight StatusLineDirty cterm=none ctermbg=none ctermfg=yellow
highlight StatusLineHasErrors cterm=bold ctermbg=none ctermfg=red
highlight StatusLineHasWarnings cterm=bold ctermbg=none ctermfg=yellow
highlight StatusLineHasInformation cterm=bold ctermbg=none ctermfg=blue
highlight StatusLineIcon cterm=bold ctermbg=none ctermfg=white
highlight StatusLineOperator cterm=bold ctermbg=none ctermfg=blue
highlight StatusLineNumber cterm=bold ctermbg=none ctermfg=magenta
highlight StatusLineInactive cterm=bold ctermbg=white ctermfg=black
highlight StatusLineNC cterm=none ctermbg=none ctermfg=none
highlight StatusLineNormal cterm=none ctermbg=black ctermfg=none
highlight StatusLineModified cterm=none ctermbg=yellow ctermfg=black
highlight StatusLineUnmodified cterm=none ctermbg=green ctermfg=black
highlight StatusLineReadOnly cterm=none ctermbg=red ctermfg=black
highlight StatusLineSeparator cterm=bold ctermbg=none ctermfg=none

"
" Plugins
"

" Gitsigns

highlight GitSignsAdd ctermbg=none ctermfg=green
highlight GitSignsChange ctermbg=none ctermfg=yellow
highlight GitSignsDelete ctermbg=none ctermfg=red
highlight GitSignsChangeDelete ctermbg=none ctermfg=magenta

" Nvim Tree

highlight NvimTreeFolderIcon cterm=bold ctermfg=blue
highlight NvimTreeGitDeleted ctermfg=red
highlight NvimTreeGitDirty ctermfg=yellow
highlight NvimTreeGitMerge ctermfg=magenta
highlight NvimTreeGitNew ctermfg=yellow
highlight NvimTreeGitStaged ctermfg=green
highlight NvimTreeIndentMarker ctermfg=magenta
highlight NvimTreeStatusLineNC ctermbg=black
highlight NvimTreeSymlink cterm=bold ctermfg=cyan
highlight NvimTreeStatusLineNC ctermbg=black ctermfg=black

"
" Float
"

highlight Float ctermbg=none
highlight FloatBorder ctermbg=none ctermfg=none
highlight FloatShadow ctermbg=none
highlight FloatShadowThrough cterm=bold ctermbg=yellow

"
" Syntax
"

" Vim

highlight link vimHiGroup Identifier
highlight link vimGroup Identifier
highlight link vimHiAttrib SpecialChar
highlight link vimHiCtermColor SpecialChar

" Lua

highlight link luaTSConstructor TSPuncBracket

" Fish

highlight link fishTSFunction TSKeyword
highlight link fishTSFuncBuiltin TSKeyword
highlight link fishTSParameter TSNumber

" Yaml

highlight link yamlFloat TSBoolean

" CSS

highlight link scssTSVariable TSKeyword
highlight link scssTSProperty TSKeyword
highlight link scssTSType TSMethod

" LSP

highlight link LspDiagnosticsDefaultError Error
highlight link LspVirtualFloatingError Error
highlight link LspVirtualSignError Error
highlight link LspVirtualTextError Error
highlight link LspDiagnosticsDefaultWarning Warning
highlight link LspVirtualFloatingWarning Warning
highlight link LspVirtualSignWarning Warning
highlight link LspVirtualTextWarning Warning
highlight link LspDiagnosticsDefaultInformation Info
highlight link LspVirtualFloatingInformation Info
highlight link LspVirtualSignInformation Info
highlight link LspVirtualTextInformation Info

" PHP

highlight phpTSVariableBuiltin ctermfg=white
