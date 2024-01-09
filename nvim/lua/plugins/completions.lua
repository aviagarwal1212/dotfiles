return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        window = {
          completion = {
            winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,CursorLine:TelescopeSelection",
            border = "rounded"
          },
          documentation = {
            winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder",
            border = "rounded"
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Esc>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1 },
          { name = "luasnip",  group_index = 1 },
          { name = "path",     group_index = 2 },
          { name = "buffer",   group_index = 2 },
          { name = "copilot",  group_index = 2 },
        }),
      })
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          auto_trigger = false,
        },
        filetypes = {
          ["oil"] = false,
        }
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }
}
