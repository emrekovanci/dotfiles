local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ══════
-- BUFFER
-- ══════

map("n", "<C-Left>", "<cmd>bprev<cr>", opts)
map("n", "<C-Right>", "<cmd>bnext<cr>", opts)
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete Buffer" })

-- ═════════════════
-- WINDOW MANAGEMENT
-- ═════════════════

map("n", "<S-Left>", "<C-W>h", opts)
map("n", "<S-Down>", "<C-W>j", opts)
map("n", "<S-Up>", "<C-W>k", opts)
map("n", "<S-Right>", "<C-W>l", opts)

map("n", "<C-M-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-M-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-M-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-M-Right>", "<cmd>vertical resize +5<CR>", opts)

-- ═════════════
-- LINE MOVEMENT
-- ═════════════

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
map("n", "<A-Down>", ":m .+1<CR>", opts)
map("n", "<A-Up>", ":m .-2<CR>", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- ══════════
-- COPY/PASTE
-- ══════════

map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>p", [["+p]])
map({ "n", "v" }, "<leader>P", [["+P]])

-- ════════
-- TEXT OPS
-- ════════

-- search/replace
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- ══════
-- OTHERS
-- ══════

map("n", "<leader>la", "<cmd>Lazy<CR>", { desc = "Open Lazy.nvim menu" })
map("t", "<ESC>", "<C-\\><C-n>")

map({ "n", "v" }, "<C-Up>", "{", opts)
map({ "n", "v" }, "<C-Down>", "}", opts)

map("n", "<leader>hx", "<cmd>vnew %:t.hex | r !xxd #<cr>", { desc = "Open buffer in hex view" })

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L49-L53
map({ "i", "n", "s" }, "<esc>", function() vim.cmd("noh") return "<esc>" end, { expr = true, desc = "Escape and Clear hlsearch" })
