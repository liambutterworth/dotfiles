--
-- Mappings
--
-- :: Global
-- :: Leader

--
-- Global
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
vim.keymap.set('n', '<c-w><bs>', '<cmd>bwipe<cr>')

--
-- Leader
--

vim.keymap.set('n', '<leader>h', '<c-w>h')
vim.keymap.set('n', '<leader>j', '<c-w>j')
vim.keymap.set('n', '<leader>k', '<c-w>k')
vim.keymap.set('n', '<leader>l', '<c-w>l')
vim.keymap.set('n', '<leader>q', '<c-w>q')
vim.keymap.set('n', '<leader>s', '<c-w>s')
vim.keymap.set('n', '<leader>v', '<c-w>v')
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>n', 'gt')
vim.keymap.set('n', '<leader>p', 'gT')
