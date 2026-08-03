return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {},
		},
		{
			"MeanderingProgrammer/treesitter-modules.nvim",
			opts = {
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			},
		},
	},
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"c",
			-- "diff",
			-- "html",
			"luadoc",
			-- "markdown",
			-- "markdown_inline",
			"go",
			"gomod",
			"gowork",
			"java",
		}

		vim.defer_fn(function()
			require("nvim-treesitter").install(parsers):wait(300000)
		end, 0)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				vim.treesitter.start()
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		require("ts_context_commentstring").setup({})
	end,
}
