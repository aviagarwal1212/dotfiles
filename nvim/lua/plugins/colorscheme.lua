return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        styles = {
          comments = { italic = false },
          keywords = { italic = true },
          functions = { italic = true },
          variables = { italic = false },
        },
        on_colors = function (colors)
          colors.bg_statusline = colors.bg
          colors.green = "#95bb72"
          colors.bg_float = colors.bg_highlight
          colors.bg_popup = colors.bg_highlight
          colors.border_highlight = colors.comment
        end
      })
      vim.cmd.colorscheme "tokyonight-storm"
    end
  }
}
