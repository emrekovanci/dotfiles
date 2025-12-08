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
                keywords = { italic = false },
                sidebars = "transparent",
                floats = "transparent",
            },
            on_colors = function(colors)
                colors.bg_statusline = ""
            end,
            on_highlights = function(hl, colors)
                hl.EndOfBuffer = {
                    fg = colors.cyan,
                }
                hl.WinSeparator = {
                    fg = colors.terminal_black,
                }
                hl.Comment = {
                    fg = colors.green,
                    italic = true,
                }
            end,
        })

        vim.cmd("colorscheme tokyonight")
    end,
}
