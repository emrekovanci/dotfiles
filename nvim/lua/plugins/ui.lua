return {
    {
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        "stevearc/oil.nvim",
        lazy = false,
        init = function()
            vim.keymap.set("n", "<C-x><C-f>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            vim.keymap.set("n", "<C-x><C-p>", function() require("oil").open(vim.fn.getcwd()) end, { desc = "Open Oil in CWD" })
        end,
        config = function()
            require("oil").setup({
                columns = {
                    -- "permissions",
                    "type",
                    "mtime",
                    "size",
                },
                win_options = {
                    signcolumn = "yes",
                },
                delete_to_trash = true,
                keymaps = {
                    ["'"] = { "actions.cd", mode = "n" },
                    ["f"] = { "actions.select" },
                },
                view_options = {
                    show_hidden = true,
                    is_hidden_file = function(name, bufnr)
                        local m = name:match("^.git$")
                        return m ~= nil
                    end,
                },
                confirmation = { border = "rounded" },
                progress = { border = "rounded" },
                keymaps_help = { border = "rounded" },
            })
        end,
    },

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
                    theme  = { normal = { } },
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard" } },
                },
                sections = {
                    lualine_a = { { "mode", fmt = function(s) return "[" .. mode_map[s] .. "]" or s end } },
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
                extensions = { "lazy", "quickfix" },
            }

            return opts
        end,
    },
}
