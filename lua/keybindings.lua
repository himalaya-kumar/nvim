local keymap = vim.api.nvim_set_keymap

keymap('n','<c-s>',':w<CR>',{})
keymap('i','<c-s>','<Esc>:w<CR>a',{})

local opts = { noremap = true }
keymap('n','<c-j>','<c-w>j',opts)
keymap('n','<c-h>','<c-w>h',opts)
keymap('n','<c-k>','<c-w>k',opts)
keymap('n','<c-l>','<c-w>l',opts)

keymap('n','<c-d>','yyp',opts)
keymap('i','<c-d>','<ESC>yyp',opts)
keymap('n','<c-x>','dd',opts)

keymap("n",'<c-t>','<cmd>Telescope live_grep<cr>',opts)

