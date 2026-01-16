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
        end,
    },
}
