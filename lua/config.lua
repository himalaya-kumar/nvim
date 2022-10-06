vim.wo.number = true
vim.wo.relativenumber = true
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
vim.cmd[[inoremap ii <Esc>]]

vim.cmd[[map <C-n> :NERDTreeToggle<CR>]]


-- For FOlding code 
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
