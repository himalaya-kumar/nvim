return {
	-- amongst your other plugins
	-- { 'akinsho/toggleterm.nvim', version = "*", config = true }
	-- or
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = { --[[ things you want to change go here]]
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
}
