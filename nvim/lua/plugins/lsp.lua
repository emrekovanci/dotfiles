if vim.fn.has("nvim-0.12") ~= 1 then
    return {}
end

return {
    "neovim/nvim-lspconfig",
    enabled = true,
    opts = {},
    config = vim.schedule_wrap(function(_, opts)

        -- override builtin floatin func
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.title = ""
            opts.border = "rounded"
            opts.max_width = opts.max_width or 130
            opts.max_height = opts.max_height or 20
            -- opts.close_events = opts.close_events or { "CursorMoved", "CursorMovedI", "BufLeave", "WinLeave", "InsertEnter", "LSPDetach" }
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
            callback = function(args)
                -- utility for key binding
                local bufnr = args.buf
                local map = function(mode, l, r, opts)
                    opts = opts or {}
                    opts.silent = true
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("i", "<c-space>", vim.lsp.completion.get)
                -- map("i", "<c-s>", vim.lsp.buf.signature_help)
                map("n", "<leader>K", vim.diagnostic.open_float)
                -- map("n", "K", vim.lsp.buf.hover)

                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                -- disable semantic tokens
                if client:supports_method("textDocument/semanticTokens") then
                    client.server_capabilities.semanticTokensProvider = nil
                end

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

        vim.diagnostic.config({
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
                virtual_text = false,
                float = { source = "always" },
            },
        })

        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--enable-config",
                "--background-index",
                "--completion-style=detailed",
                "--pch-storage=memory",
            },
        })

        vim.lsp.enable({ "clangd", "rust_analyzer" })
    end),
}
