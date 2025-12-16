return {
    "nvim-mini/mini.base16",
    lazy = false,
    priority = 1000,
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "minicyan",
            callback = function()
                local set_hl = vim.api.nvim_set_hl
                set_hl(0, "LineNrAbove", { bg = "NONE" })
                set_hl(0, "LineNrBelow", { bg = "NONE" })
                set_hl(0, "StatusLine", { bg = "#0a2a2a" })
            end,
        })

        vim.cmd("colorscheme minicyan")
    end,
}
