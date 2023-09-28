return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd([[colorscheme nightfox]])
    -- vim.cmd([[set termguicolors]])
    -- vim.cmd([[set t_8f=^[[38;2;%lu;%lu;%lum]])
    -- vim.cmd([[set t_8b=^[[48;2;%lu;%lu;%lum]])
    require('lualine').setup { options = { theme = 'nightfox' } }
  end
}

-- TO ADD Multiline comment in lua
--[=====[
--]=====]
