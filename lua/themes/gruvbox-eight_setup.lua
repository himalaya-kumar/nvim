return {
  "lifepillar/vim-gruvbox8",
  branch = 'neovim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_italics           = 0
    vim.g.gruvbox_italicize_strings = 0
    vim.g.gruvbox_bold              = 1
    vim.cmd([[colorscheme gruvbox8_soft]])
    vim.cmd([[set termguicolors]])
    vim.cmd([[set background=light]])
    require('lualine').setup {}
    -- vim.cmd([[set t_8f=^[[38;2;%lu;%lu;%lum]])
    -- vim.cmd([[set t_8b=^[[48;2;%lu;%lu;%lum]])
  end
}
