return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        },
    },
    cmd = "Telescope",
    opts = {
        defaults = {
            path_display = { "truncate" },
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
        },
        pickers = {
            live_grep = {
                previewer = false,
            },
            find_files = {
                previewer = false,
                find_command = { "fd", "--type", "file", "--color", "never" },
            },
            git_files = { previewer = false },
            buffers = { sort_lastused = true, sort_mru = true },
            colorscheme = { enable_preview = true },
        },
        extensions = {
            live_grep_args = {
                preview = true,
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("live_grep_args")
    end,
    keys = {
        -- general
        { "<leader>t",   function() require("telescope.builtin").builtin() end, desc = "Telescope" },
        { "<leader>ff",  function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>gf",  function() require("telescope.builtin").git_files() end, desc = "Git Files" },
        { "<leader>lg",  function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { "<leader>lgi", function() require("telescope").extensions.live_grep_args.live_grep_args({ path_display = { "tail" }}) end, desc = "Live Grep Args" },
        { "<leader>fb",  function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>ht",  function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "<leader>.",   function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find siblings" },

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
