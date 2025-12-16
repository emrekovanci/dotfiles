return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
        -- ensure_installed = ..., adds a bunch of startup time.
        -- manually install required languages on windows
        local ensure_installed_list = vim.iter({
            { "bash", "json", "jsonc", "markdown", "markdown_inline", "regex", "toml", "vimdoc", "xml", "yaml" },
            { "lua", "c", "cpp", "cmake", "c_sharp", "rust", "dockerfile", "glsl", "hlsl" },
            { "php", "css", "html", "javascript" },
        }):flatten():totable()

        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = is_windows and { } or ensure_installed_list,

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = false,

            indent = {
                enable = false,
            },

            highlight = {
                enable = true,

                use_languagetree = true,
            },
        })

        vim.keymap.set(
            "n",
            "<leader>ti",
            function()
                vim.cmd("TSUpdate " .. table.concat(ensure_installed_list, " "))
            end,
            { desc = "Install common parsers" }
        )
    end,
}
