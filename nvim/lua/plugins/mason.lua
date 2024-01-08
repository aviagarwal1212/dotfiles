return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {      
        ensure_installed = {
          "lua_ls", --lua
          "pyright", --python
          "ruff_lsp", --python
          "bashls", --bash
          "dockerls", --docker
          "gopls", --go
          "html", --html
          "htmx", --htmx
          "jsonls", --json
          "rust_analyzer", --rust
          "sqlls", --sql
          "svelte", --svelte
          "taplo", --toml
          "tailwindcss", --tailwind
          "terraformls", --terraform
          "tsserver", --typescript
          "zls", --zig
        },
        automatic_installation = true,
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities 
          })
        end,
      }
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim"
    },
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.diagnostics.mypy,
          require("null-ls").builtins.formatting.prettier
        }
      })
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
      })
    end
  }
}
