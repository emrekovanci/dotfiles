return {

    {
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        "stevearc/oil.nvim",
        lazy = false,
        init = function()
            vim.keymap.set("n", "<C-x><C-f>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            -- vim.keymap.set("n", "_", function() require("oil").open(vim.fn.getcwd()) end, { desc = "Open Oil in CWD" })
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
                columns = {
                    -- "permissions",
                    "type",
                    "size",
                    "mtime",
                },
                delete_to_trash = true,
                keymaps = {
                    ["'"] = { "actions.cd", mode = "n" },

                    ["<leader>Z"] = {
                        desc = "Compress file or directory",
                        callback = function()
                            local oil = require("oil")

                            local entry = oil.get_cursor_entry()
                            if not entry then
                                vim.notify("No file or directory selected!", vim.log.levels.WARN)
                                return
                            end

                            local name = entry.name
                            local parent_dir = oil.get_current_dir()

                            vim.ui.input({ prompt = "Zip name: ", default = name .. ".zip" }, function(input)
                                if input and input ~= "" then
                                    local cmd = string.format(
                                        "cd %s && 7z a %s %s",
                                        vim.fn.shellescape(parent_dir),
                                        vim.fn.shellescape(input),
                                        vim.fn.shellescape(name)
                                    )

                                    local output = vim.fn.system(cmd)
                                    if vim.v.shell_error == 0 then
                                        vim.notify("Compressed: " .. input, vim.log.levels.INFO)
                                    else
                                        vim.notify("7zip error: " .. output, vim.log.levels.ERROR)
                                    end
                                end
                            end)
                        end
                    },

                    ["<leader>X"] = {
                        desc = "Decompress Archive",
                        callback = function()
                            local oil = require("oil")

                            local entry = oil.get_cursor_entry()
                            if not entry then
                                vim.notify("No archieve selected!", vim.log.levels.WARN)
                                return
                            end

                            local name = entry.name
                            local dir = oil.get_current_dir()

                            if not name:match("%.zip$") and
                                not name:match("%.rar$") and
                                not name:match("%.7z$") then
                                vim.notify("Not an archive file!", vim.log.levels.WARN)
                                return
                            end

                            local cmd = string.format(
                                "cd %s && 7z x %s",
                                vim.fn.shellescape(dir),
                                vim.fn.shellescape(name)
                            )

                            -- create a throwaway buffer
                            local buf = vim.api.nvim_create_buf(false, true)
                            vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })

                            -- create a floating window using the throaway buffer
                            local width = math.floor(vim.o.columns * 0.8)
                            local height = math.floor(vim.o.lines * 0.7)
                            local win = vim.api.nvim_open_win(buf, true, {
                                relative = "editor",
                                width = width,
                                height = height,
                                row = (vim.o.lines - height) / 2,
                                col = (vim.o.columns - width) / 2,
                                style = "minimal",
                                border = "rounded",
                            })

                            -- set the current window to the floating window
                            vim.api.nvim_set_current_win(win)

                            -- run extract in the floating window
                            vim.fn.termopen(cmd, {
                                on_exit = function(_, code)
                                    if vim.api.nvim_win_is_valid(win) then
                                        if code == 0 or code == 255 then
                                            vim.api.nvim_win_close(win, true)
                                        end
                                    end
                                    vim.defer_fn(function()
                                        local info = (code == 0 or code == 255) and vim.log.levels.INFO or vim.log.levels.ERROR
                                        vim.notify("Zip terminal exit code: " .. code, info)
                                    end, 100)
                                end,
                            })

                            vim.cmd.startinsert()
                        end,
                    },
                },
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
                confirmation = {
                    border = "rounded",
                },
                keymaps_help = {
                    border = "rounded",
                },
            })
        end,
    },


}
