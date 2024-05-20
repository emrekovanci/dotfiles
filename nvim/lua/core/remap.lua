vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_create_user_command("Q", "q", { })
