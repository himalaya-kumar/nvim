local opt = vim.opt
local wo = vim.wo
local bo = vim.bo
local g = vim.g

opt.termguicolors = true
opt.mouse = "a"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = "menuone,noselect"
opt.showmode = false
opt.splitright = true
opt.splitbelow = true
opt.confirm = true
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.cursorline = true

bo.expandtab = true
bo.shiftwidth = 2
bo.softtabstop = 2
bo.tabstop = 2

g.mapleader = " "
g.maplocalleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
