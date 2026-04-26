return {
	{
		"blazkowolf/gruber-darker.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			opts = {
				bold = false,
				invert_selection = false,
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = false,
				},
				underline = false,
				undercurl = false,
				transparent = false, -- Set to true for transparent background
			},
		},
		config = function(_, opts)
			require("gruber-darker").setup(opts)
			vim.cmd.colorscheme("gruber-darker")
		end,
		-- config = function()
		-- 	vim.cmd.colorscheme("gruber-darker")
		-- end,
	},
}
