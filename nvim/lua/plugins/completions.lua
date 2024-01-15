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
                                enabled = true,
                                snippet = {
                                        expand = function(args)
                                                require("luasnip").lsp_expand(args.body)
                                        end
                                },
                                completion = {
                                        completeopt = "menu,menuone,noinsert",
                                },
                                window = {
                                        completion = {
                                                winhighlight =
                                                "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,CursorLine:TelescopeSelection",
                                                border = "rounded"
                                        },
                                        documentation = {
                                                winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder",
                                                border = "rounded"
                                        },
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ["<C-u>"] = function(fallback)
                                                if cmp.visible() then
                                                        cmp.mapping.scroll_docs(-4)
                                                else
                                                        fallback()
                                                end
                                        end,
                                        ["<C-d>"] = function(fallback)
                                                if cmp.visible() then
                                                        cmp.mapping.scroll_docs(4)
                                                else
                                                        fallback()
                                                end
                                        end,
                                        ["<Tab>"] = function(fallback)
                                                if cmp.visible() then
                                                        cmp.confirm()
                                                else
                                                        fallback()
                                                end
                                        end,
                                        ["<Esc>"] = function(fallback)
                                                if cmp.visible() then
                                                        cmp.abort()
                                                        fallback()
                                                else
                                                        fallback()
                                                end
                                        end,
                                }),
                                sources = cmp.config.sources({
                                        { name = "luasnip",  group_index = 2 },
                                        { name = "nvim_lsp", group_index = 2 },
                                        { name = "copilot",  group_index = 2, keyword_length = 2 },
                                        { name = "path",     group_index = 2 },
                                }),
                                sorting = {
                                        priority_weight = 2,
                                        comparators = {
                                                require("copilot_cmp.comparators").prioritize,
                                                cmp.config.compare.offset,
                                                cmp.config.compare.exact,
                                                cmp.config.compare.score,
                                                cmp.config.compare.recently_used,
                                                cmp.config.compare.kind,
                                                cmp.config.compare.sort_text,
                                                cmp.config.compare.length,
                                                cmp.config.compare.order,
                                        },
                                }
                        })
                end
        },
        {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = { "InsertEnter" },
                fix_pairs = true,
                config = function()
                        require("copilot").setup({
                                panel = {
                                        enabled = false,
                                },
                                suggestion = {
                                        enabled = false,
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
