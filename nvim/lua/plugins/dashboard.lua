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

        local opts = {
            theme = "doom",
            config = {
                header = vim.split(logo, "\n"),
                center = {
                    { action = "ene | startinsert",     desc = " New File",        icon = "", key = "n" },
                    { action = "Telescope oldfiles",    desc = " Recent Files",    icon = "󰋚", key = "r" },
                    { action = "Telescope live_grep",   desc = " Find Text",       icon = "", key = "g" },
                    { action = "qa",                    desc = " Quit",            icon = "", key = "q" },
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
}
