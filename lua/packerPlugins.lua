require('packer').startup( function()
  -- Packer 
  use 'wbthomason/packer.nvim'

  --  use 'preservim/nerdtree'
  
  use { 'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'mhartington/oceanic-next'
  use 'nvim-lua/plenary.nvim'

  -- IDE
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'kyazdani42/nvim-web-devicons'
  use {'neoclide/coc.nvim', branch = 'release'}
  use { 'mhartington/formatter.nvim' }
-- LSP
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

-- Toggle Term
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  	require("toggleterm").setup{
	size=40,
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
     end}

end)

-- Nord Color Setup
require ('lualine').setup({options = { theme = 'nord' }})
-- Night fly
-- require('lualine').setup({options = {theme = 'nightfly'}})

