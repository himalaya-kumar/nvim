return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("nvim-web-devicons").has_loaded()
		local alpha = require("alpha")
		local theta = require("alpha.themes.theta")
		local dashboard = require("alpha.themes.dashboard")

		theta.header.val = {
			[[]],
			[[          ]],
			[[ ▄██████▄  ████████▄   ▄█  ███▄▄▄▄    ]],
			[[ ███    ███ ███   ▀███ ███  ███▀▀▀██▄ ]],
			[[ ███    ███ ███    ███ ███▌ ███   ███ ]],
			[[ ███    ███ ███    ███ ███▌ ███   ███ ]],
			[[ ███    ███ ███    ███ ███▌ ███   ███ ]],
			[[ ███    ███ ███    ███ ███  ███   ███ ]],
			[[ ███    ███ ███   ▄███ ███  ███   ███ ]],
			[[  ▀██████▀  ████████▀  █▀    ▀█   █▀  ]],
			[[]],
		}
		theta.buttons.val = {
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		alpha.setup(theta.config)
	end,
}
