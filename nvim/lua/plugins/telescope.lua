return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    opts = {
        defaults = {
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
            prompt_prefix = " ",
            selection_caret = "  ",
            results_title = false,
        },
        pickers = {
            find_files = {
                previewer = false,
                find_command = { "fd", "--type", "file", "--hidden", "--no-ignore", "--exclude", ".git", "--strip-cwd-prefix=always" },
            },
            git_files = { previewer = false },
            buffers = { sort_lastused = true, sort_mru = true },
            colorscheme = { enable_preview = true },
        },
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Git Files" },
        { "<leader>lg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>ht", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "<leader>.", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h")}) end, desc = "Find siblings" },
    },
}
