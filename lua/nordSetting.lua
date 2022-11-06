require('packer').use{ 'shaunsingh/nord.nvim' }
-- Nord Color Scheme Activation
vim.cmd[[colorscheme nord]]

-- Nord Color Setup

-- Load the colorscheme
vim.g.nord_borders = true
vim.g.nord_italic = false
vim.g.nord_enable_sidebar_background = false
require('nord').set()
-- require( 'lualine').setup {theme = 'nord'}
