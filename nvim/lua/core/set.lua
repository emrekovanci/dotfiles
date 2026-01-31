local opt = vim.opt
local g = vim.g

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

opt.number = true         -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.cursorline = false    -- Don't highlight current line
opt.wrap = false          -- Disable line wrap
-- opt.scrolloff = 5      -- Keep 5 lines above/below cursor
-- opt.sidescrolloff = 4  -- Keep 4 columns left/right of cursor
opt.sj = -50
opt.grepprg = [[rg --no-heading --trim --column --hidden --glob "!.git/**"]]
-- opt.shellslash = true  -- Breaks lualine branch component

-- indentation
opt.shiftwidth = 4        -- Size of an indent
opt.tabstop = 4           -- Number of spaces tabs count for
opt.softtabstop = 4       -- Soft tab stop
opt.expandtab = true      -- Use spaces instead of tabs
opt.smartindent = true    -- Smart auto-indenting

-- search
opt.ignorecase = true     -- Ignore case
opt.smartcase = true      -- Don't ignore case with capitals
opt.incsearch = true      -- Show matches as you type
opt.hlsearch = true       -- Highlight search results

-- invisible characters
opt.list = true           -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- split
opt.splitright = true     -- Put new windows right of current
opt.splitbelow = true     -- Put new windows below current
opt.splitkeep = "screen"

-- visual
opt.background = "dark"
opt.termguicolors = true  -- Enable 24-bit colors
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
opt.pumheight = 12        -- Make popup menu smaller
opt.showmode = false      -- Lualine shows mode, so disable default
opt.laststatus = 3        -- Global status line
if vim.fn.has("nvim-0.11") then
    opt.winborder = "none"
    opt.pumborder = "rounded" -- For lsp completion menu
end
opt.confirm = true
opt.foldlevel = 99
opt.fillchars = { fold = " ", foldsep = " ", diff = "╱", eob = " " }

-- workflow
opt.virtualedit = "block" -- Allow currsor to move where there is no text in visual block mode
opt.mouse = "a"           -- Enable mouse mode
opt.completeopt = "menu,menuone,noselect,noinsert"

-- filetypes (default filetypes: <Neovim_Install_Dir>/share/nvim/runtime/lua/vim/filetype.lua)
vim.filetype.add({
    extension = {
        uproject    = "json",   -- Unreal Engine
        uplugin     = "json",   -- Unreal Engine
        codespellrc = "dosini", -- C++ Codespell
    },
    pattern = {
        [".*%.blade%.php"] = "html",
    }
})

-- file handling
opt.shadafile = "NONE"
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false    -- Don't create swap files
opt.undofile = true     -- Persistent undo
opt.updatetime = 200    -- Faster completion
opt.timeoutlen = 400    -- Lower than default (1000)
opt.ttimeoutlen = 0     -- Key code timeout
opt.autoread = true     -- Auto reload files changed outside vim
opt.autowrite = true    -- Auto save

-- terminal
if vim.fn.has("win32") then
    -- opt.shell        = "pwsh.exe -NoLogo"
    -- opt.shellcmdflag = "-ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'PlainText';"
    -- opt.shellredir   = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    -- opt.shellpipe    = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    -- opt.shellquote   = ""
    -- opt.shellxquote  = ""
end
