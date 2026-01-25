-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    callback = function()
        if vim.w.auto_cursorline then
            vim.wo.cursorline = true
            vim.w.auto_cursorline = nil
        end
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    callback = function()
        if vim.wo.cursorline then
            vim.w.auto_cursorline = true
            vim.wo.cursorline = false
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 250 }
    end,
})


-- Readonly things
vim.api.nvim_create_autocmd({ "BufRead" }, {
    callback = function(args)
        local buf = args.buf
        local path = vim.api.nvim_buf_get_name(buf)

        path = vim.fs.normalize(path)

        if path:find("/_deps/") then
            vim.bo[buf].readonly = true
        end
    end,
})
