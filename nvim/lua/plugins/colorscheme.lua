return {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
      require("monoglow").setup({
          on_colors = function(colors)
              colors.glow = "#d29922"
          end,

          on_highlights = function(hl, c)
              hl.FloatBorder = { fg = c.glow }
              hl.TelescopePromptBorder = { fg = c.glow }
              hl.TelescopeBorder = { fg = c.glow }
          end
      })

    vim.cmd("colorscheme monoglow-lack")
  end,
}
