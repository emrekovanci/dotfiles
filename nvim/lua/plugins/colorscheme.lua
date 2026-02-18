return {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bold = true,
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
                local hl = vim.api.nvim_set_hl

                -- completion menu
                hl(0, "Pmenu", { bg = "none", fg = "none" })
                hl(0, "PmenuBorder", { link = "GruberDarkerBg2" })
                hl(0, "PmenuThumb", { bg = "#52494e", fg = "none" })

                -- lsp
                hl(0, "LspSignatureActiveParameter", { link = "GruberDarkerBrown" })

                -- theme overrides
                hl(0, "GruberDarkerFg0", { fg = "#d1c7c5" })
                hl(0, "GruberDarkerFg1", { fg = "#d1c7c5" })
                hl(0, "GruberDarkerFg2", { fg = "#d1c7c5" })

                -- others
                hl(0, "TabLineFill", { bg = "#181818"} )
                hl(0, "healthSectionDelim", { bg = "#121212" })
                hl(0, "Number", { fg = "#d1c7c5" })
                hl(0, "NormalSB", { bg = "#181818", fg = "#d1c7c5" })
                hl(0, "NormalFloat", { bg = "#181818", fg = "#d1c7c5" })
                hl(0, "QuickFixLine", { link = "GruberDarkerBrown" })
                hl(0, "@punctuation.bracket", { fg = "#d1c7c5" })
                hl(0, "@punctuation.special", { fg = "#d1c7c5" })
                hl(0, "@type", { link = "GruberDarkerYellow" })
                hl(0, "@property", { fg = "#d1c7c5" })
                hl(0, "@number.float", { fg = "#d1c7c5" })
                hl(0, "Special", { fg = "#d1c7c5" })

                -- rust
                hl(0, "@rust.attribute.all", { link = "GruberDarkerQuartz" })
                hl(0, "@rust.attribute.name", { link = "GruberDarkerQuartz" })
                hl(0, "@function.macro.rust", { link = "GruberDarkerNiagara" })
                hl(0, "@keyword.exception.rust", { link = "GruberDarkerNiagara" })
            end
        })

        vim.o.background = "dark"
        vim.cmd.colorscheme("gruber-darker")
    end,
}
