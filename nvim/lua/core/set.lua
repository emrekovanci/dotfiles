local opt = vim.opt
local g = vim.g

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

opt.number = true              -- Print line number
opt.relativenumber = true      -- Relative line numbers
opt.cursorline = true          -- Highlight current line
opt.wrap = false               -- Disable line wrap
opt.scrolloff = 10             -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor

-- indentation
opt.shiftwidth = 4              -- Size of an indent
opt.tabstop = 4                 -- Number of spaces tabs count for
opt.softtabstop = 4             -- Soft tab stop
opt.expandtab = true            -- Use spaces instead of tabs
opt.smartindent = true          -- Smart auto-indenting

-- search
opt.ignorecase = true           -- Ignore case
opt.smartcase = true            -- Don't ignore case with capitals
opt.incsearch = true            -- Show matches as you type
opt.hlsearch = true             -- Highlight search results

-- invisible characters
opt.list = true                 -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- split
opt.splitright = true           -- Put new windows right of current
opt.splitbelow = true           -- Put new windows below current
opt.splitkeep = "screen"

-- visual
opt.termguicolors = true        -- Enable 24-bit colors
opt.signcolumn = "yes"          -- Always show the signcolumn, otherwise it would shift the text each time
opt.pumheight = 12              -- Make popup menu smaller
opt.background = "dark"
opt.showmode = false            -- Lualine shows mode, so disable default
opt.laststatus = 3              -- Global status line
opt.winborder = "shadow"
opt.confirm = true
opt.foldlevel = 99

-- workflow
opt.virtualedit = "block"       -- Allow currsor to move where there is no text in visual block mode
opt.mouse = "a"                 -- Enable mouse mode
opt.completeopt:append({ "noselect", "menuone", "popup" })

-- filetypes (default filetypes: <Neovim_Install_Dir>/share/nvim/runtime/lua/vim/filetype.lua)
vim.filetype.add({
    extension = {
        ["code-workspace"]   = "jsonc",   -- VSCode
        ["sublime-keymap"]   = "jsonc",   -- Sublime Text
        ["sublime-theme"]    = "jsonc",   -- Sublime Text
        ["sublime-settings"] = "jsonc",   -- Sublime Text
        uproject             = "json",    -- Unreal Engine
        uplugin              = "json",    -- Unreal Engine
        codespellrc          = "dosini",  -- C++ Codespell
    },
    pattern = {
        [".*%.blade%.php"]   = "html",
    }
})

-- file handling
opt.shadafile = "NONE"
opt.backup = false       -- Don't create backup files
opt.writebackup = false  -- Don't create backup before writing
opt.swapfile = false     -- Don't create swap files
opt.undofile = true      -- Persistent undo
opt.updatetime = 200     -- Faster completion
opt.timeoutlen = 300     -- Lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 0      -- Key code timeout
opt.autoread = true      -- Auto reload files changed outside vim
opt.autowrite = true     -- Auto save
