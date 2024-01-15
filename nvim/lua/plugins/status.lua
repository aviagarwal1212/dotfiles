return {
        {
                "nvim-lualine/lualine.nvim",
                config = function()
                        local function empty()
                                return " "
                        end

                        local function breadcrumb()
                                return require("nvim-navic").get_location()
                        end

                        require("lualine").setup({
                                options = {
                                        theme = "nordic",
                                        component_separators = "",
                                        section_separators = "",
                                        globalstatus = true,
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
                                        }, { 'filetype', colored = true } },
                                        lualine_y = {},
                                        lualine_z = { {
                                                'filename',
                                                symbols = {
                                                        modified = "●",
                                                        readonly = "",
                                                        unnamed = "MENU",
                                                        newfile = "NEW"
                                                },
                                                color = {
                                                        gui = "",
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
                "lewis6991/gitsigns.nvim",
                config = function()
                        require("gitsigns").setup()
                end
        }
}
