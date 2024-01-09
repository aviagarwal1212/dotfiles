return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
      local parsers = require("nvim-treesitter.parsers").get_parser_configs()
      parsers.just = {
        install_info = {
          url = "https://github.com/IndianBoy42/tree-sitter-just",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
        },
        maintainers = { "@IndianBoy42" },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require('treesitter-context').setup()
    end
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      require("outline").setup({})
    end
  }
}
