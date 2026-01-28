return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ensure_installed_list = vim.iter({
            { "bash", "json", "jsonc", "markdown", "markdown_inline", "regex", "toml", "vimdoc", "xml", "yaml", "powershell" },
            { "lua", "c", "cpp", "cmake", "c_sharp", "rust", "dockerfile", "glsl", "hlsl" },
            { "php", "css", "html", "javascript" },
        }):flatten():totable()

        local file_types = vim.iter({
            { "bash", "json", "jsonc", "markdown", "toml", "xml", "yaml", "ps1" },
            { "lua", "c", "cpp", "cmake", "cs", "rust", "glsl", "hlsl" },
            { "php", "css", "html", "js" }
        }):flatten():totable()

        require("nvim-treesitter").setup {
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            install_dir = vim.fn.stdpath("data") .. "/site",
            highlight = { enable = true },
            folds = { enable = true },
            indent = { enable = true },
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = file_types,
            callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()

                -- folds, provided by Neovim
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"

                -- indentation, provided by nvim-treesitter
                -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        vim.keymap.set(
            "n",
            "<leader>ti",
            function()
                vim.cmd("TSInstall " .. table.concat(ensure_installed_list, " "))
            end,
            { desc = "Install common parsers" }
        )
    end,
}
