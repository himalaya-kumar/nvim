return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nightfox]])
    vim.cmd([[set termguicolors]])
    require('lualine').setup {}
  end
}

-- TO ADD Multiline comment in lua
--[=====[
--]=====]
