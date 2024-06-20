return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
        local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
        -- ensure_installed = ..., adds a bunch of startup time.
        -- manually install required languages on windows
        local ensure_installed_list = is_windows and { } or {
            -- general
            "bash",
            "lua",
            "toml",
            "yaml",
            "vimdoc",

            -- main
            "c",
            "cpp",
            "cmake",
            "c_sharp",
            "rust",
            "dockerfile",
            "glsl",

            -- web
            "php",
            "css",
            "html",
            "javascript",
        }

        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = ensure_installed_list,

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = false,

            indent = {
                enable = true,
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
