require('packer').use { 'catppuccin/nvim',
	as = "catppuccin",
	run = ":CatppuccinCompile"
}

-- Color Scheme Activation
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require('catppuccin').setup()

vim.cmd[[colorscheme catppuccin]]

require( 'lualine' ).setup {

	options = {
		theme = 'catppuccin'
	}
}
