return {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bold = false,
        italic = {
            strings = false,
            comments = false,
        },
    },
    config = function(_, opts)
        require("gruber-darker").setup(opts)

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "gruber-darker",
            callback = function()
                vim.api.nvim_set_hl(0, "Number", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg0", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg1", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg2", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "@type", { link = "GruberDarkerYellow" })
                vim.api.nvim_set_hl(0, "@property", { fg = "#d1c7c5" })
                --vim.api.nvim_set_hl(0, "@module.cpp", { fg = "#d1c7c5" })
            end

        })

        vim.o.background = "dark"
        vim.cmd.colorscheme("gruber-darker")
    end,
}
