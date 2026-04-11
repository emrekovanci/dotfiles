local opt = vim.opt
local g = vim.g

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
opt.number = true         -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true     -- Highlight current line
opt.wrap = false          -- Disable line wrap
opt.sj = -50
opt.grepprg = "rg --vimgrep"

-- indentation
opt.shiftwidth = 4        -- Size of an indent
opt.tabstop = 4           -- Number of spaces tabs count for
opt.softtabstop = 4       -- Soft tab stop
opt.expandtab = true      -- Use spaces instead of tabs
opt.smartindent = true    -- Smart auto-indenting

-- search
opt.ignorecase = true     -- Ignore case
opt.smartcase = true      -- Don't ignore case with capitals

-- invisible characters
opt.list = true          -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- split
opt.splitright = true     -- Put new windows right of current
opt.splitbelow = true     -- Put new windows below current
opt.splitkeep = "screen"

-- visual
opt.termguicolors = true  -- Enable 24-bit colors
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
opt.pumheight = 12        -- Make popup menu smaller
opt.laststatus = 3        -- Global status line
opt.confirm = true
opt.fillchars = { fold = " ", foldsep = " ", diff = "╱", eob = " " }
opt.winborder = "none"
opt.pumborder = "rounded" -- For lsp completion menu

-- workflow
opt.virtualedit = "block" -- Allow currsor to move where there is no text in visual block mode
opt.mouse = "a"           -- Enable mouse mode
opt.completeopt = "menu,menuone,noselect,noinsert"

-- file handling
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false    -- Don't create swap files
opt.undofile = true     -- Persistent undo
opt.updatetime = 200    -- Faster completion
opt.timeoutlen = 400    -- Lower than default (1000)
opt.autowrite = true    -- Auto save
