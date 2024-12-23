-- NOTE: Make sure terminal supports this
vim.opt.termguicolors    = true
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.bo.expandtab         = true
vim.bo.shiftwidth        = 2
vim.bo.softtabstop       = 2
vim.bo.tabstop           = 2
vim.bo.smartindent       = true

-- Enable mouse mode
vim.o.mouse              = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard          = 'unnamedplus'

-- Enable break indent
vim.o.breakindent        = true

-- Save undo history
vim.o.undofile           = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase         = true
vim.o.smartcase          = true

-- Keep signcolumn on by default
vim.wo.signcolumn        = 'yes'

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt        = 'menuone,noselect'

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader          = ' '
vim.g.maplocalleader     = ' '

-- for default tab and space
vim.opt.list             = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors    = true
