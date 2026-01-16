return {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        italic = {
            strings = false,
            comments = false,
        },
    },
    config = function(_, opts)
        require("gruber-darker").setup(opts)
        vim.o.termguicolors = true
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruber-darker")
    end,
}
