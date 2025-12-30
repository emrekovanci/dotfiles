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
                    lualine_a = { { "mode", padding = 0, fmt = function(s) return "[" .. mode_map[s] .. "]" or s end } },
                    lualine_b = { },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            symbols = { modified = "[•]", readonly = "[󰌾]" },
                            path = 1,
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
                extensions = { "lazy", "oil" },
            }

            return opts
        end,
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        init = function()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
        config = function()
            -- helper function to parse output
            local function parse_output(proc)
                local result = proc:wait()
                local ret = {}
                if result.code == 0 then
                    for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
                        -- Remove trailing slash
                        line = line:gsub("/$", "")
                        ret[line] = true
                    end
                end
                return ret
            end

            -- build git status cache
            local function new_git_status()
                return setmetatable({}, {
                    __index = function(self, key)
                        local ignore_proc = vim.system(
                            { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
                            {
                                cwd = key,
                                text = true,
                            }
                        )
                        local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
                            cwd = key,
                            text = true,
                        })
                        local ret = {
                            ignored = parse_output(ignore_proc),
                            tracked = parse_output(tracked_proc),
                        }

                        rawset(self, key, ret)
                        return ret
                    end,
                })
            end
            local git_status = new_git_status()

            -- Clear git status cache on refresh
            local refresh = require("oil.actions").refresh
            local orig_refresh = refresh.callback
            refresh.callback = function(...)
                git_status = new_git_status()
                orig_refresh(...)
            end

            require("oil").setup({
                view_options = {
                    is_hidden_file = function(name, bufnr)
                        local dir = require("oil").get_current_dir(bufnr)
                        local is_dotfile = vim.startswith(name, ".") and name ~= ".."
                        -- if no local directory (e.g. for ssh connections), just hide dotfiles
                        if not dir then
                            return is_dotfile
                        end
                        -- dotfiles are considered hidden unless tracked
                        if is_dotfile then
                            return not git_status[dir].tracked[name]
                        else
                            -- Check if file is gitignored
                            return git_status[dir].ignored[name]
                        end
                    end,
                },
            })
        end,
    },

}
