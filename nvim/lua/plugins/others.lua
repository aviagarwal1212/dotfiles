return {
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({
				options = {
					pair_spaces = true
				}
			})
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│"
			},
			scope = {
				show_start = false,
				show_end = false,
			}
		}
	},
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup()
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},
	{
		"David-Kunz/gen.nvim"
	}
}
