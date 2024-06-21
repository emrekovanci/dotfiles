return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            local opts = {
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
                extensions = { "lazy" },
            }

            return opts
        end,
    },
}
