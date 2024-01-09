return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "storm",
  --       styles = {
  --         comments = { italic = false },
  --         keywords = { italic = true },
  --         functions = { italic = true },
  --         variables = { italic = false },
  --       },
  --       on_colors = function(colors)
  --         colors.bg_statusline = colors.bg
  --         colors.green = "#95bb72"
  --         colors.bg_float = colors.bg_highlight
  --         colors.bg_popup = colors.bg_highlight
  --         colors.border_highlight = colors.comment
  --       end
  --     })
  --     vim.cmd.colorscheme "tokyonight-storm"
  --   end
  -- },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require("nordic.colors")
      require("nordic").setup({
        italic_comments = false,
        telescope = {
          style = 'classic'
        },
        cursorline = {
          theme = 'light',
          blend = 0.8,
        },
        override = {
          ---trouble
          TroubleNormal = { bg = colors.black1 },
          TroubleText = { fg = colors.fg },
          TroubleCount = { fg = colors.white1, bg = colors.gray2 },
          TroubleIndent = { fg = colors.gray1 },
          TroubleFile = { fg = colors.cyan.bright },
          TroubleFoldIcon = { fg = colors.gray1 },
        }
      })
      require("nordic").load()
    end
  }
}
