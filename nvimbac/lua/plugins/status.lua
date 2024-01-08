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
          theme = "tokyonight",
          component_separators = "",
          section_separators = "",
          globalstatus = true
        },
        sections = {
          lualine_z = { { empty, draw_empty = true, padding = 0 } },
          lualine_b = { { breadcrumb, colors = { bg = 'black' } } },
          lualine_c = {},
          lualine_x = { {
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic' },
            symbols = {
              error = "E",
              warn = "W",
              info = "I",
              hint = "H"
            },
          }, 'progress', { 'filetype', colored = false } },
          lualine_y = {},
          lualine_a = { {
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
  }
}
