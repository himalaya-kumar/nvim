return {
	"sainnhe/gruvbox-material",
	lazy = false, -- Load this immediately
	priority = 1000, -- Ensure it loads before other plugins
	config = function()
		-- 1. Disable all italics
		vim.g.gruvbox_material_enable_italic = 0

		-- 2. Set the contrast for light mode
		-- Options: 'hard', 'medium', 'soft'
		vim.g.gruvbox_material_background = "hard"

		-- 3. Tell Neovim to use the light palette
		vim.opt.background = "dark"

		-- 4. Apply the colorscheme
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
