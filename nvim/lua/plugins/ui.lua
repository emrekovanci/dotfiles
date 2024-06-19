return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            symbols = { modified = "[]", readonly = "[󰌾]" },
                            path = 1,
                        },
                    },
                    lualine_x = {
                        { "encoding" },
                        { "fileformat", icons_enabled = true, symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
                        { "filetype", icons_enabled = false },
                    },
                    lualine_y = { "location" },
                    lualine_z = { "progress" },
                },
            }
        end,
    },
}
