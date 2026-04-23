return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"c",
				"diff",
				"html",
				"luadoc",
				"markdown",
				"markdown_inline",
				"go",
				"gomod",
				"gowork",
				"java",
			},
			highlight = { enable = true },
		})
	end,
}
