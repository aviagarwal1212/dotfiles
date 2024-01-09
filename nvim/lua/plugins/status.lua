return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function breadcrumb()
        return require("nvim-navic").get_location()
      end

      local function empty()
        return " "
      end

      require("lualine").setup({
        options = {
          theme = "nordic",
          component_separators = "",
          section_separators = "",
          globalstatus = true
        },
        sections = {
          lualine_a = { { empty, draw_empty = true, padding = 0 } },
          lualine_b = {},
          lualine_c = { breadcrumb },
          lualine_x = { {
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic' },
            symbols = {
              error = "E",
              warn = "W",
              info = "I",
              hint = "H"
            },
            -- diagnostics_color = {
            --   error = { fg = colors.red },
            --   warn = { fg = colors.orange },
            --   hint = { fg = colors.green },
            --   info = { fg = colors.blue },
            -- },
          }, { 'filetype', colored = false } },
          lualine_y = {},
          lualine_z = { {
            'filename',
            symbols = {
              modified = "●",
              readonly = "!",
              unnamed = "MENU",
              newfile = "NEW"
            }
          } },
        },
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("which-key").setup({})
    end
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end
  }
}
