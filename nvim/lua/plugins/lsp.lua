return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
        position = "right"
      })
    end
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true
        },
        separator = "> ",
        highlight = true,
        format_text = function(text)
          return text .. " "
        end
      })
    end
  }
}
