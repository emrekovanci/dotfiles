return {
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    "stevearc/oil.nvim",
    lazy = false,
    init = function()
        vim.keymap.set("n", "<C-x><C-f>",
            function()
                local oil = require("oil")
                if vim.bo.filetype == "oil" then
                    oil.open()
                else
                    oil.open(vim.fn.getcwd())
                end
            end,
        { desc = "Oil Jump" })
    end,
    config = function()
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
                ["f"] = { "actions.select" },
            },
            view_options = {
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
}
