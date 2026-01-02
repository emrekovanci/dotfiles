return {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
        local logo = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local nvim_config_action = "execute 'cd " .. vim.fn.stdpath("config") .. "' | Telescope find_files"

        local opts = {
            theme = "doom",
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                center = {
                    { action = "ene | startinsert",      desc = " New File",     icon = "", key = "n" },
                    { action = "Telescope oldfiles",     desc = " Recent Files", icon = "", key = "r" },
                    { action = nvim_config_action,       desc = " Config",       icon = "", key = "c" },
                    { action = "qa",                     desc = " Quit",         icon = "", key = "q" },
                },
                footer = {}
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        return opts
    end,
    keys = {
        { "<leader>d", "<cmd>Dashboard<cr>", desc = "Open Dashboard" },
    },
}
