return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    opts = {
        defaults = {
            vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--trim" },
            border = true,
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                },
                width = 0.8,
                height = 0.8,
            },
            sorting_strategy = "ascending",
            winblend = 0,
            prompt_prefix = "  ",
            selection_caret = "  ",
            entry_prefix = "  ",
            results_title = false,
            preview = false,
        },
        pickers = {
            find_files = { find_command = { "fd", "--type", "file", "--color", "never" } },
            buffers = { sort_lastused = true, sort_mru = true },
            colorscheme = { enable_preview = true },
        },
    },
    keys = {
        -- general
        { "<leader>tt",  function() require("telescope.builtin").builtin() end, desc = "Telescope" },
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>.",  function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find siblings" },
        { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Git Files" },
        { "<leader>lg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>ht", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },

        -- grep
        { "<leader>ws",  function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end },
        { "<leader>Ws",  function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end },

        -- others
        { "<leader>ep", function() require("telescope.builtin").find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }) end },

        -- lsp
        -- { "<leader>wd", function() require("telescope.builtin").diagnostics() end, desc = "Workspace Diagnostics" },
        -- { "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document Symbols" },
    },
}
