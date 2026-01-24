local path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local repo = 'https://github.com/folke/lazy.nvim.git'

if not (vim.uv or vim.loop).fs_stat(path) then
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        repo,
        path,
    })

    if vim.v.shell_error ~= 0 then
        local messages = {
            { 'Failed to clone lazy.nvim:\n', "ErrorMsg" },
            { output, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }

        vim.api.nvim_echo(messages, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(path)

require('lazy').setup('plugins', {
    ui = {
        border = 'single',
        wrap = false,
    },
})
