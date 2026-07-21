return {
	"atelierbram/Base2Tone-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- 1. Enable true colors
		vim.opt.termguicolors = true

		-- 2. Load the official Sea Dark theme
		vim.cmd("colorscheme base2tone_sea_dark")

		-- 3. Define your custom color
		local custom_blue = "#d6e9ff"

		-- Override Comments
		vim.api.nvim_set_hl(0, "Comment", { fg = custom_blue, italic = true })
		vim.api.nvim_set_hl(0, "SpecialComment", { fg = custom_blue })
		vim.api.nvim_set_hl(0, "@comment", { fg = custom_blue, italic = true })

		-- Override Brackets
		vim.api.nvim_set_hl(0, "Delimiter", { fg = custom_blue })
		vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = custom_blue })
	end,
}
