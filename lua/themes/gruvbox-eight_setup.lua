return {
  "lifepillar/vim-gruvbox8",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox8_soft]])
    vim.cmd([[set termguicolors]])
    vim.cmd([[set background=light]])
    -- vim.cmd([[set t_8f=^[[38;2;%lu;%lu;%lum]])
    -- vim.cmd([[set t_8b=^[[48;2;%lu;%lu;%lum]])
    require('lualine').setup {}
  end
}
