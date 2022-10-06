require('packer').use { 'sam4llis/nvim-tundra' }

vim.opt.background = 'dark'
vim.cmd('colorscheme tundra')

-- Set `termguicolors` before loading the colorscheme.
vim.opt.termguicolors = true

-- Clear all highlight groups before loading the colorscheme.
vim.cmd('highlight clear')
require('nvim-tundra').load()

-- require ('lualine').setup({options = { theme = 'tundra' }})
