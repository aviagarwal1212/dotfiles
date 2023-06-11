return {
  -- colorscheme
  colorscheme = "catppuccin",

  -- plugins
  plugins = {
    {
      -- installing and configuring catppuccin
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup({
          flavour = "frappe"
        })
      end,
      opts = {
        integrations = {
          nvimtree = false,
          ts_rainbow = false,
          aerial = true,
          dap = { enabled = true, enable_ui = true },
          mason = true,
          neotree = true,
          notify = true,
          semantic_tokens = true,
          symbols_outline = true,
          telescope = true,
          which_key = true,
        }
      }
    },
    {
      -- installing and configuring undotree
      "mbbill/undotree",
      keys = {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "toggle undotree" }
      }
    },
    {
      -- installing and configuring copilot
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "User AstroFile",
      opts = { suggestion = { auto_trigger = true, debounce = 150 } },
    },
    {
      -- installing and configuring leap
      "ggandor/flit.nvim",
      keys = function()
        ---@type LazyKeys[]
        local ret = {}
        for _, key in ipairs { "f", "F", "t", "T" } do
          ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
        end
        return ret
      end,
      opts = { labeled_modes = "nx" },
      dependencies = {
        "ggandor/leap.nvim",
        keys = {
          { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
          { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
          { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
          local leap = require "leap"
          for k, v in pairs(opts) do
            leap.opts[k] = v
          end
          leap.add_default_mappings(true)
        end,
        dependencies = {
          "tpope/vim-repeat",
        },
      },
    },
    {
      -- modifying cmp
      "hrsh7th/nvim-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua",
      },
      opts = function(_, opts)
        local cmp, copilot = require "cmp", require "copilot.suggestion"
        -- free up Tab from cmp completion but utilize for copilot
        opts.mapping["<Tab>"] = function(fallback)
          if copilot.is_visible() then
            copilot.accept()
          else
            fallback()
          end
        end
        opts.mapping["<S-Tab>"] = function(callback)
          callback()
        end
        -- utilize Ctrl-X, Ctrl-Z for copilot traversal
        opts.mapping['<C-x>'] = function()
          if copilot.is_visible() then
            copilot.next()
          end
        end
        opts.mapping['<C-z>'] = function()
          if copilot.is_visible() then
            copilot.prev()
          end
        end
        -- use Ctrl-C to close cmp and copilot completion
        opts.mapping["<C-c>"] = function(fallback)
          if cmp.visible() then
            cmp.close()
          elseif copilot.is_visible() then
            copilot.dismiss()
          else
            fallback()
          end
        end
      end
    },
  },
  -- lsp setup
  lsp = {
    servers = {
      "bashls",
      "dockerls",
      "html",
      "jsonls",
      "svelte",
      "tailwindcss",
      "tsserver",
      "lua_ls",
      "gopls",
    },
    config = {
      bashls = function(opts)
        opts.filetypes = { "sh", "zsh", "bash" }
        return opts
      end
    }
  },
  -- polish functions
  polish = function()
    local opts_esc = { nowait = true }
    local map = vim.api.nvim_set_keymap
    map("n", ";", ":", opts_esc)
  end,
}
