vim.wo.number = true
vim.wo.relativenumber = false
vim.bo.expandtab=true
vim.bo.shiftwidth=2
vim.bo.softtabstop=2
vim.bo.tabstop=2
vim.bo.smartindent = true
-- Set mouse property
vim.cmd[[set mouse=a]]
vim.cmd[[set list]]
-- vim.cmd[[au VimEnter *  NERDTree]]
vim.opt.termguicolors = true

--vim.cmd[[inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"]]
--vim.cmd[[inoremap <silent><expr> <cr> "\<c-g>u\<CR>"]]
