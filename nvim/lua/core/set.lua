local opt = vim.opt
local g = vim.g

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- line number
opt.number = true              -- Print line number
opt.relativenumber = true      -- Relative line numbers

-- tabs, spaces & indents
opt.shiftwidth = 4              -- Size of an indent
opt.tabstop = 4                 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.expandtab = true            -- Use spaces instead of tabs
opt.autoindent = true
opt.list = true                 -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- search
opt.ignorecase = true           -- Ignore case
opt.smartcase = true            -- Don't ignore case with capitals

-- split windows
opt.splitright = true           -- Put new windows right of current
opt.splitbelow = true           -- Put new windows below current

-- appearance
opt.pumheight = 10              -- Make popup menu smaller
opt.guicursor = ""
opt.termguicolors = true        -- True color support
opt.background = "dark"
opt.signcolumn = "yes"          -- Always show the signcolumn, otherwise it would shift the text each time
opt.wrap = false                -- Disable line wrap
opt.cursorline = true           -- Enable highlighting of the current line
opt.scrolloff = 10              -- Lines of context
opt.showmode = false            -- Lualine shows mode, so disable default
opt.laststatus = 3              -- Global status line

-- workflow
opt.commentstring = "// %s"

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
        [".*%.blade%.php"] = "html",
    }
})

-- others
opt.history = 1000
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 200
opt.confirm = true
