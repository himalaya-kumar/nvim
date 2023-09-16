require('packer').use {
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',
	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',
	'numToStr/Comment.nvim',
}

require("packer").use {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	requires = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

		{
			'j-hui/fidget.nvim',
			tag = 'legacy',
			config = function()
				require('fidget').setup {}
			end,
		},
		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
}

require('packer').use {
	'hrsh7th/nvim-cmp',
	requires = {
		-- Snippet Engine & its associated nvim-cmp source
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',

		-- Adds LSP completion capabilities
		'hrsh7th/cmp-nvim-lsp',

		-- Adds a number of user-friendly snippets
		'rafamadriz/friendly-snippets',
	}
}

require('indent_blankline').setup {
	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help indent_blankline.txt`
	char = '┊',
	show_trailing_blankline_indent = false,
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jdtls",
		"gopls"
	}
});

local on_attach = function(_, _)
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

	vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end


require("lspconfig").lua_ls.setup {
	on_attach = on_attach
}

require("lspconfig").jdtls.setup {
	on_attach = on_attach
}

require("lspconfig").gopls.setup {
	on_attach = on_attach
}
