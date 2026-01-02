return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    {
        "rmagatti/auto-session",
        lazy = false,
        keys = {
            { "<leader>wr", "<cmd>AutoSession save<CR>", desc = "Save session" },
            { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
        },
        opts = {
            session_lens = {
                picker = "telescope",
                mappings = {
                    delete_session = { "i", "<C-d>" },
                    alternate_session = { "i", "<C-s>" },
                    copy_session = { "i", "<C-y>" },
                },
                picker_opts = {
                    preview = false,
                    load_on_setup = true,
                },
            },
        }
    }
}
