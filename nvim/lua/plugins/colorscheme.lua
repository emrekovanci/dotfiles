return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(hl, col)
                hl.EndOfBuffer = {
                    fg = col.cyan,
                }
            end,
        })

        vim.cmd("colorscheme tokyonight")
    end,
}
