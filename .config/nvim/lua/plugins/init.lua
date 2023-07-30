local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local plugins = {
    require('plugins.cmp'),
    require('plugins.core'),
    require('plugins.lspconfig'),
    require('plugins.luasnip'),
    require('plugins.telescope'),
    require('plugins.treesitter'),
}

local options = {
    ui = {
        border = 'single',
    }
}

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins, options)
