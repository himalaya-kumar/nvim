return {
	"EdenEast/nightfox.nvim",
	name = "nightfox",
	priority = 1000,
	config = function()
		-- Color Scheme Activation
		-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
		-- vim.cmd([[colorscheme dayfox]])
		-- vim.cmd([[colorscheme duskfox]])
		vim.cmd([[colorscheme dawnfox]])
		-- require('lualine').setup { options = { theme = 'mocha' } }
	end,
}
