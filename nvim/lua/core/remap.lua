local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ═════════════════
-- BUFFER NAVIGATION
-- ═════════════════

-- Tab/Shift-Tab
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Alternative buffer switching
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- ═════════════════
-- WINDOW MANAGEMENT
-- ═════════════════

-- Move between windows with Ctrl+hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- ═════════════
-- LINE MOVEMENT
-- ═════════════

-- Alternative line movement
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
