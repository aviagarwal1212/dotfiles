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
}
