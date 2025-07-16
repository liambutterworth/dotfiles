--
-- Mappings
--

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'gQ', 'm`ggq``')
vim.keymap.set('n', 'g=', 'm`gg=G``')
vim.keymap.set('n', 'c*', '*``cgn')
vim.keymap.set('n', 'c#', '#``cgN')
vim.keymap.set('n', 'd*', '*``dgn')
vim.keymap.set('n', 'd#', '#``dgN')
vim.keymap.set('n', '<bs>', '<c-^>')

vim.keymap.set('i', '<c-e><space>', '<space><space><esc>i')
vim.keymap.set('i', '<c-e><cr>', '<cr><esc>O')
vim.keymap.set('i', '<c-e>,', '<space><esc>m`A,<esc>``s')
vim.keymap.set('i', '<c-e>;', '<space><esc>m`A;<esc>``s')

vim.keymap.set('n', '<space>r', '<cmd>LspRestart<cr>')
