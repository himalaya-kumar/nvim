return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	keys = {
		{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
	end,
}
