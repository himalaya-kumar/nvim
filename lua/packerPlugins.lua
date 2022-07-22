require('packer').startup( function()
  -- Packer 
  use 'wbthomason/packer.nvim'
  -- nord colorscheme
  use 'shaunsingh/nord.nvim'
  -- Night fly colorscheme
  use 'bluz71/vim-nightfly-guicolors'

--  use 'preservim/nerdtree'
  use { 'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  
  -- Nerd Tree and night time theme
  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'mhartington/oceanic-next'
--  use 'preservim/nerdtree'
--  use 'Xuyuanp/nerdtree-git-plugin'
	
  -- IDE
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'kyazdani42/nvim-web-devicons'
  use {'neoclide/coc.nvim', branch = 'release'}
  -- jdtls
  use 'mfussenegger/nvim-jdtls'

  -- welcome screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        -- require'alpha'.setup(require'alpha.themes.startify'.config)
	local alpha = require'alpha'
	local startify = require 'alpha.themes.startify'
			
	alpha.setup(startify.config)
    end   
   }
end)

-- Nord Color Setup
require ('lualine').setup({options = { theme = 'nord' }})
-- Night fly
-- require('lualine').setup({options = {theme = 'nightfly'}})

-- From Line 38 
	--startify.section.header.val = {
--	[[]], 
--[[ ░█████╗░░██╗░░░░░░░██╗░██████╗░█████╗░███╗░░░███╗███████╗  ░█████╗░██╗░░░░░░██████╗░░█████╗░ ]]
--[[ ██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗████╗░████║██╔════╝  ██╔══██╗██║░░░░░██╔════╝░██╔══██╗ ]]
--[[ ███████║░╚██╗████╗██╔╝╚█████╗░██║░░██║██╔████╔██║█████╗░░  ███████║██║░░░░░██║░░██╗░██║░░██║ ]]
--[[ ██╔══██║░░████╔═████║░░╚═══██╗██║░░██║██║╚██╔╝██║██╔══╝░░  ██╔══██║██║░░░░░██║░░╚██╗██║░░██║ ]]
--[[ ██║░░██║░░╚██╔╝░╚██╔╝░██████╔╝╚█████╔╝██║░╚═╝░██║███████╗  ██║░░██║███████╗╚██████╔╝╚█████╔╝ ]]
--[[ ╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝  ╚═╝░░╚═╝╚══════╝░╚═════╝░░╚════╝░ ]]
--				[[]]
--	}

