vim.api.nvim_create_user_command(
    "Rg",
    function(opts)
        vim.cmd("silent! grep! " .. opts.args)
        local half_width = math.floor(vim.o.columns / 2)
        vim.cmd("vert copen " .. half_width)
    end,
    { nargs = "+" }
)

vim.cmd("cabbrev rg Rg")
