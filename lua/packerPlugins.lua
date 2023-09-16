require('packer').startup(function()
	-- Packer
	use 'wbthomason/packer.nvim'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'   -- optional, updated every week. (see issue #1193)
	}
	require('nvim-tree').setup()

	use 'ryanoasis/vim-devicons'
	use 'mhartington/oceanic-next'
	use 'nvim-lua/plenary.nvim'

	use 'sbdchd/neoformat'
	use 'christoomey/vim-tmux-navigator'
	-- IDE
	use 'kyazdani42/nvim-web-devicons'
	use { 'neoclide/coc.nvim', branch = 'release' }

	-- Toggle Term
	use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require("toggleterm").setup {
			size = 40,
			direction = 'float',
			open_mapping = [[<c-\>]],
			close_mapping = [[<c-n>]],
			--	float_opts = {
			--		border ='curved',
			--		width = 40,
			--		height = 15,
			--		winblend = 3,
		}
		--	}
	end }
end)
