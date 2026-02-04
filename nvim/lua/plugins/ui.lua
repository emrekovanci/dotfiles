return {
    {
        "nvim-focus/focus.nvim",
        version = false,
        opts = {
            autoresize = {
                minwidth = 20,
                minheight = 5,
                height_quickfix = 0,
            },
            ui = {
                cursorline = false,
                signcolumn = false,
            },
        },
    },

    {
        "gelguy/wilder.nvim",
        event = "CmdlineEnter",
        opts = {
            modes = { ":", "/", "?" },
        },
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

            local mode_map = {
                ["NORMAL"]    = "N",
                ["O-PENDING"] = "N?",
                ["INSERT"]    = "I",
                ["VISUAL"]    = "V",
                ["V-BLOCK"]   = "VB",
                ["V-LINE"]    = "VL",
                ["V-REPLACE"] = "VR",
                ["REPLACE"]   = "R",
                ["COMMAND"]   = "!",
                ["SHELL"]     = "SH",
                ["TERMINAL"]  = "T",
                ["EX"]        = "X",
                ["S-BLOCK"]   = "SB",
                ["S-LINE"]    = "SL",
                ["SELECT"]    = "S",
                ["CONFIRM"]   = "Y?",
                ["MORE"]      = "M",
            }

            local opts = {
                options = {
                    theme  = {
                        normal = {
                           -- b = { bg = "#753e04", fg = "#ffffff" },
                           -- c = { bg = "#753e04", fg = "#ffffff" },
                           -- a = { bg = "#753e04", fg = "#ffffff" },
                        }
                    },
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard" } },
                },
                sections = {
                    lualine_a = { { "mode", padding = { left = 1, right = 0 }, fmt = function(s) return "[" .. mode_map[s] .. "]" or s end } },
                    lualine_b = { },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            symbols = { modified = "[•]", readonly = "[ɸ]" },
                            path = 0,
                        },
                    },
                    lualine_x = {
                        { "branch", icons_enabled = false },
                        { "encoding" },
                        { "fileformat", icons_enabled = true, symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
                        { "filetype", icons_enabled = false },
                    },
                    lualine_y = { { "location" }, { "progress" } },
                    lualine_z = { },
                },
                extensions = { "lazy", "oil", "quickfix", require("compile-mode.extensions.lualine") },
            }

            return opts
        end,
    },


    {
        "voldikss/vim-floaterm",
        config = function()
            vim.keymap.set("n", '<C-">', function()
                local curr = vim.fn["floaterm#buflist#curr"]()
                if curr == -1 then
                    local path = vim.fn.escape(vim.loop.cwd(), ' %#|"')
                    vim.cmd("FloatermNew --width=0.9 --height=0.9 --cwd=" .. path)
                else
                    vim.cmd("FloatermToggle")
                end
            end)

            vim.keymap.set("t", '<C-">', "<C-\\><C-n>:FloatermToggle<CR>")
        end,
    },
}
