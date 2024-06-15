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

    {
        "stevearc/oil.nvim",
        opts = {},
        cmd = "Oil",
        keys = {
            {
                "-",
                function()
                    return require("oil").open()
                end,
                desc = "Open parent directory",
            },
        },
        -- https://github.com/folke/lazy.nvim/issues/533
        init = function()
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("lazy").load({ plugins = { "oil.nvim" } })
                end
            end
            if not require("lazy.core.config").plugins["oil.nvim"]._.loaded then
                vim.api.nvim_create_autocmd("BufNew", {
                    callback = function()
                        if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
                            require("lazy").load({ plugins = { "oil.nvim" } })
                            -- Once oil is loaded, we can delete this autocmd
                            return true
                        end
                    end,
                })
            end
        end,
    }
}
