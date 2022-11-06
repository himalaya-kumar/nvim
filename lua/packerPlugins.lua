require('packer').startup( function()
  -- Packer 
  use 'wbthomason/packer.nvim'

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use 'ryanoasis/vim-devicons'
  use 'mhartington/oceanic-next'
  use 'nvim-lua/plenary.nvim'

  -- IDE
  use 'kyazdani42/nvim-web-devicons'
  use {'neoclide/coc.nvim', branch = 'release'}

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

   use {
  	'VonHeikemen/lsp-zero.nvim',
 	 requires = {
    	-- LSP Support
    	{'neovim/nvim-lspconfig'},
    	{'williamboman/mason.nvim'},
    	{'williamboman/mason-lspconfig.nvim'},

    	-- Autocompletion
    	{'hrsh7th/nvim-cmp'},
    	{'hrsh7th/cmp-buffer'},
    	{'hrsh7th/cmp-path'},
    	{'saadparwaiz1/cmp_luasnip'},
    	{'hrsh7th/cmp-nvim-lsp'},
    	{'hrsh7th/cmp-nvim-lua'},

    	-- Snippets
    	{'L3MON4D3/LuaSnip'},
    	{'rafamadriz/friendly-snippets'},
  }
}

end)

-- Nord Color Setup
-- require ('lualine').setup({options = { theme = 'nord' }})
-- Night fly
-- require('lualine').setup({options = {theme = 'nightfly'}})

