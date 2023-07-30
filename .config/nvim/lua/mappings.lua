vim.keymap.set('n', 'j', 'gj', { noremap=true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', 'gj', 'j', { noremap = true })
vim.keymap.set('n', 'gk', 'k', { noremap = true })
vim.keymap.set('n', 'gQ', 'm`ggq``', { noremap = true })
vim.keymap.set('n', 'g=', 'm`gg=G``', { noremap = true })
vim.keymap.set('n', 'c*', '*``cgn', { noremap = true })
vim.keymap.set('n', 'c#', '#``cgN', { noremap = true })
vim.keymap.set('n', 'd*', '*``dgn', { noremap = true })
vim.keymap.set('n', 'd#', '#``dgN', { noremap = true })
vim.keymap.set('n', '<bs>', '<c-^>', { noremap = true })
vim.keymap.set('n', '<c-w>t', '<cmd>tabnew<cr>', { noremap = true })
vim.keymap.set('n', '<c-w><bs>', '<cmd>bwipe<cr>', { noremap = true })
