return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          layout_config = {
            horizontal = {
              preview_width = 0.5
            }
          }
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-w>"] = actions.delete_buffer + actions.move_to_top
              }
            },
            layout_strategy = "vertical"
          },
          oldfiles = {
            layout_strategy = "vertical"
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          undo = {
          },

        }
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("undo")
    end,
  }
}
