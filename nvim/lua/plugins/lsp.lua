return {
    "neovim/nvim-lspconfig",
    opts = function()
        local ret = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "E",
                        [vim.diagnostic.severity.WARN]  = "W",
                        [vim.diagnostic.severity.INFO]  = "I",
                        [vim.diagnostic.severity.HINT]  = "H",
                    },
                },
                float = { source = "always", header = "", border = "rounded" },
            },
        }
        return ret
    end,
    config = vim.schedule_wrap(function(_, opts)
        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("my.lsp", {}),
            callback = function(args)
                local bufnr = args.buf
                local map = function(mode, l, r, opts)
                    opts = opts or {}
                    opts.silent = true
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("i", "<c-space>", vim.lsp.completion.get)
                map("i", "<c-S>", vim.lsp.buf.signature_help)
                map("n", "<leader>K", vim.diagnostic.open_float)
                map("n", "K", function() vim.lsp.buf.hover {
                    border = "rounded",
                    max_height = 20,
                    max_width = 130,
                    close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
                } end)

                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                if client:supports_method("textDocument/implementation") then
                    -- Create a keymap for vim.lsp.buf.implementation ...
                end

                -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
                if client:supports_method("textDocument/completion") then
                    -- Optional: trigger autocompletion on EVERY keypress. May be slow!
                    -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                    -- client.server_capabilities.completionProvider.triggerCharacters = chars
                    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
                end

                -- Auto-format ("lint") on save.
                -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                if not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                        end,
                    })
                end
            end,
        })

        vim.lsp.enable({ "clangd" })
    end),
}
