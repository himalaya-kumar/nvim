return {
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"christoomey/vim-tmux-navigator",
		-- Disable default mappings since we have our own in basicMap.lua
		keys = false,  -- lazy.nvim way to skip keymap setup
		init = function()
			-- Prevent plugin from setting its own mappings
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
}
