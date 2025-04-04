return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
        -- ensure_installed = ..., adds a bunch of startup time.
        -- manually install required languages on windows
        local ensure_installed_list = vim.iter({
            { "bash", "json", "jsonc", "markdown", "markdown_inline", "regex", "toml", "vimdoc", "xml", "yaml" },
            { "lua", "c", "cpp", "cmake", "c_sharp", "rust", "dockerfile", "glsl" },
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
