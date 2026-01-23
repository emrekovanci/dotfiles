return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    {
        "ej-shafran/compile-mode.nvim",
        version = "^5.0.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.g.compile_mode = {
                default_command = "scripts/build.bat --no-env --no-configure",
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "compilation",
                callback = function()
                    vim.opt_local.wrap = true
                    vim.opt_local.linebreak = true
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.signcolumn = "no"
                end,
            })
        end,
    },
}
