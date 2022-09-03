require('packer').use { 'bluz71/vim-nightfly-guicolors' }

-- Night fly color Scheme
vim.cmd[[colorscheme nightfly]]
vim.cmd[[set termguicolors]]
vim.g.nightflyCursorColor = 1
vim.g.nightflyItalics = 0


require ('lualine').setup({options = { theme = 'nightfly' }})
