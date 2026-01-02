local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ═════════════════
-- BUFFER NAVIGATION
-- ═════════════════

map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete Buffer"})

-- ═════════════════
-- WINDOW MANAGEMENT
-- ═════════════════

map("n", "<C-w><Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-w><Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-w><Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-w><Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<C-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +5<CR>", opts)

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

map({"n", "v"}, "<leader>y", [["+y]])   -- `n` and `v` yank the selected text to the system clipboard.
map("n", "<leader>Y", [["+Y]])          -- yank the current line to the system clipboard.

-- ════════
-- TEXT OPS
-- ════════

-- search/replace
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- ══════
-- OTHERS
-- ══════

map("t", "<ESC>", "<C-\\><C-n>")
map("n", "<leader>la", "<cmd>Lazy<CR>", { desc = "Open Lazy.nvim menu" })

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L49-L53
map({ "i", "n", "s" }, "<esc>", function() vim.cmd("noh") return "<esc>" end, { expr = true, desc = "Escape and Clear hlsearch" })
