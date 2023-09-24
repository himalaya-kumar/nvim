-- Very Important double ii to esc
vim.cmd [[inoremap ii <Esc>]]
-- Nvim Tree is required before
vim.cmd [[map <C-n> :NvimTreeToggle<CR>]]
-- Barber is required
-- vim.cmd [[map <C-m> :BufferNext<CR>]]

local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

keymap('n', '<c-d>', 'yyp', opts)
keymap('i', '<c-d>', '<ESC>yyp', opts)
keymap('n', '<c-x>', 'dd', opts)

keymap("n", '<c-t>', '<cmd>Telescope live_grep<cr>', opts)
keymap("n", '<c-y>', '<cmd>Telescope find_files<cr>', opts)
keymap("n", '<A-j>', 'ddjP', opts)
keymap("n", '<A-k>', 'ddkP', opts)
keymap("n", '<C-q>', '<cmd>BufferClose<cr>', opts)
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
