local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("Installing lazy.nvim and plugins, reopen nvim once done!")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" }
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = false },
    custom_keys = nil,
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "man",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "osc52",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    change_detection = {
        enabled = false,
    },
    ui = {
        border = "rounded",
        title = " Lazy Plugin Manager ",
    },
})
