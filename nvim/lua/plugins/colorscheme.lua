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
                -- completion menu
                vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", fg = "none" })
                vim.api.nvim_set_hl(0, "PmenuBorder", { link = "GruberDarkerBg2" })
                vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#52494e", fg = "none" })

                -- others
                vim.api.nvim_set_hl(0, "Number", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "NormalSB", { bg = "#181818", fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818", fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "QuickFixLine", { link = "GruberDarkerBrown" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg0", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg1", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "GruberDarkerFg2", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#d1c7c5" })
                vim.api.nvim_set_hl(0, "@type", { link = "GruberDarkerYellow" })
                vim.api.nvim_set_hl(0, "@property", { fg = "#d1c7c5" })
            end

        })

        vim.o.background = "dark"
        vim.cmd.colorscheme("gruber-darker")
    end,
}
