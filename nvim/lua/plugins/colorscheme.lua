return {
    "nvim-mini/mini.base16",
    lazy = false,
    priority = 1000,
    opts = {
        palette = {
            base00 = "#001e25",
            base01 = "#001e25",
            base02 = "#0a2a2a",
            base03 = "#788a8a",
            base04 = "#bbbbbb",
            base05 = "#d0d0d0",
            base06 = "#e6e6e6",
            base07 = "#fcfcfc",
            base08 = "#ebcd91",
            base09 = "#9f8340",
            base0A = "#209870",
            base0B = "#82e3ba",
            base0C = "#bb6d9b",
            base0D = "#a9d4ff",
            base0E = "#ffb9e5",
            base0F = "#598ab9",
        },
    },
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = "dark"
        require("mini.base16").setup(opts)
    end,
}
