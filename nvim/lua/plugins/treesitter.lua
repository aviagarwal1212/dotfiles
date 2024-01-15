return {
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                dependencies = {
                        "nvim-treesitter/nvim-treesitter-textobjects"
                },
                config = function()
                        local config = require("nvim-treesitter.configs")
                        config.setup({
                                auto_install = true,
                                highlight = { enable = true },
                                indent = { enable = true },
                                incremental_selection = {
                                        enable = true,
                                        keymaps = {
                                                init_selection = "<CR>",
                                                node_incremental = "su",
                                                scope_incremental = false,
                                                node_decremental = "sd",
                                        }
                                }
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
                "hedyhli/outline.nvim",
                config = function()
                        require("outline").setup({})
                end
        },
        {
                "SmiteshP/nvim-navic",
                dependencies = { "nvim-treesitter/nvim-treesitter" },
                config = function()
                        require("nvim-navic").setup({
                                lsp = {
                                        auto_attach = true,
                                        preference = nil,
                                }
                        })
                end
        },
        {
                "nvim-treesitter/nvim-treesitter-textobjects",
                lazy = true,
                config = function()
                        local config = require("nvim-treesitter.configs")
                        config.setup({
                                textobjects = {
                                        select = {
                                                enable = true,
                                                lookahead = true,
                                                keymaps = {
                                                        ["am"] = { query = "@function.outer", desc = "Select around function" },
                                                        ["im"] = { query = "@function.inner", desc = "Select inside function" },
                                                        ["ac"] = { query = "@class.outer", desc = "Select around class" },
                                                        ["ic"] = { query = "@class.inner", desc = "Select inside class" },
                                                },
                                        },
                                        move = {
                                                enable = true,
                                                set_jumps = true,
                                                goto_next = {
                                                        ["]m"] = { query = "@function.*", desc = "Move to next function" },
                                                        ["]c"] = { query = "@class.*", desc = "Move to next class" },
                                                        ["]p"] = { query = "@parameter.inner", desc = "Move to next parameter" },
                                                },
                                                goto_previous = {
                                                        ["[m"] = { query = "@function.*", desc = "Move to previous function" },
                                                        ["[c"] = { query = "@class.*", desc = "Move to previous class" },
                                                        ["[p"] = { query = "@parameter.inner", desc = "Move to previous parameter" },
                                                },
                                        }
                                }
                        })
                end
        }
}
